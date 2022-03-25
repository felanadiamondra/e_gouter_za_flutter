import 'dart:async';

import 'package:e_gouter_za/api/food_api.dart';
import 'package:e_gouter_za/cart_page/cart_screen.dart';
import 'package:e_gouter_za/food_page/food_details.dart';
import 'package:e_gouter_za/model/cart_bloc.dart';
import 'package:e_gouter_za/model/food.dart';
import 'package:e_gouter_za/model/restaurant.dart';
import 'package:e_gouter_za/search_food_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FastFoodPage extends StatefulWidget {
  final Restaurant resto;
  const FastFoodPage({Key? key, required this.resto}) : super(key: key);

  @override
  State<FastFoodPage> createState() => _FastFoodPageState();
}

class _FastFoodPageState extends State<FastFoodPage> {
  @override
  List<Food> foods = [];
  String query = '';
  Timer? debouncer;
  void initState() {
    super.initState();
    init();
  }

  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(VoidCallback callback,
      {Duration duration = const Duration(microseconds: 1000)}) {
    if (debouncer != null) {
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final foods = await FoodApi.fetchFoodsByRes(widget.resto.name,query);
    setState(() {
      this.foods = foods;
    });
  }

  Future searchFood(String query) async => debounce(() async {
        final foods = await FoodApi.fetchFoods(query);
        if (!mounted) return;

        setState(() {
          this.query = query;
          this.foods = foods;
        });
      });

  Widget buildFood(Food food) => ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => FoodDetails(food: food))),
      leading:
          SizedBox(height: 80.0, width: 90.0, child: Image.asset(food.url)),
      title: Text(food.name),
      subtitle: Text(food.price.toString() + "Ar"),
      trailing: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        return IconButton(
          icon: Icon(Icons.add_circle_rounded),
          onPressed: () {
            context.read<CartBloc>().add(CartFoodAdded(food));
            final snackbar = SnackBar(content: Text("Produit commandé"));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
        );
      }));

  Widget buildSearch() => SearchFoodWidget(
      text: query, onChanged: searchFood, hintText: "Search foods");

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CartScreen())),
            icon: Icon(Icons.shopping_cart),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          // buildFastFood(),

          buildSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return buildFood(food);
              },
            ),
          ),
        ],
      ),
    );
  }
}
