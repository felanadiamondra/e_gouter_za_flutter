// ignore_for_file: unused_field, dead_code

import 'package:e_gouter_za/api/food_api.dart';
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

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final foods = await FoodApi.fetchFoods(query);
    setState(() {
      this.foods = foods;
    });
  }

  Future searchFood(String query) async {
    final foods = await FoodApi.fetchFoods(query);
    if (!mounted) return;

    setState(() {
      this.query = query;
      this.foods = foods;
    });
  }

  Widget buildSearch() => SearchFoodWidget(
      text: query, onChanged: searchFood, hintText: "Search foods");

  Widget buildFood(Food food) => ListTile(
        title: Text(food.name),
        subtitle: Text(food.name),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
