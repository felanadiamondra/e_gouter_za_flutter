// ignore_for_file: unused_field, dead_code

import 'dart:async';

import 'package:e_gouter_za/api/food_api.dart';
import 'package:e_gouter_za/fast_food/fast_food_item.dart';
import 'package:e_gouter_za/food_page/food_details.dart';
import 'package:e_gouter_za/model/food.dart';
import 'package:e_gouter_za/search_food_widget.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Food> foods = [];
  String query = '';
  Timer? debouncer;

  @override
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
    final foods = await FoodApi.fetchFoods(query);
    setState(() {
      this.foods = foods;
    });
  }

  // Future searchFood(String query) async{
  //   final foods = await FoodApi.fetchFoods(query);
  //   if (!mounted) return;

  //   setState(() {
  //     this.query = query;
  //     this.foods = foods;
  //   });
  // }

  Future searchFood(String query) async => debounce(() async {
        final foods = await FoodApi.fetchFoods(query);
        if (!mounted) return;

        setState(() {
          this.query = query;
          this.foods = foods;
        });
      });

  Widget buildSearch() => SearchFoodWidget(
      text: query, onChanged: searchFood, hintText: "Search foods");

  Widget buildFastFood() => FastFood();

  Widget buildFood(Food food) => ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => FoodDetails(food: food))),
        leading:
            SizedBox(height: 80.0, width: 90.0, child: Image.asset(food.url)),
        title: Text(food.name),
        subtitle: Text(food.price.toString() + "Ar"),
        trailing: Text('Add to cart'),
      );

  //Add to cart
  void addItem(Food food) {
  
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildSearch(),
        buildFastFood(),
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
