import 'dart:async';

import 'package:e_gouter_za/api/food_api.dart';
import 'package:e_gouter_za/food_page/food_details.dart';
import 'package:e_gouter_za/model/food.dart';
import 'package:e_gouter_za/search_food_widget.dart';
import 'package:flutter/material.dart';

class ListFoodPage extends StatefulWidget {
  final String resto;

  const ListFoodPage({Key? key, required this.resto}) : super(key: key);
  @override
  State<ListFoodPage> createState() => _ListFoodPageState();
}

class _ListFoodPageState extends State<ListFoodPage> {
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
    final foods = await FoodApi.fetchFoodsByRes("La gastronomie pizza",query);
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
        trailing: Text('Add to cart'),
      );

  Widget buildSearch() => SearchFoodWidget(
      text: query, onChanged: searchFood, hintText: "Search foods");

  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
