import 'package:e_gouter_za/model/food.dart';
import 'package:flutter/material.dart';

class FilterFood extends StatefulWidget {
  const FilterFood({Key? key}) : super(key: key);

  @override
  State<FilterFood> createState() => _FilterFoodState();
}

class _FilterFoodState extends State<FilterFood> {
  late List<Food> foods;
  String query = '';


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
