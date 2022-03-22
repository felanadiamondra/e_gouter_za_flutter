import 'package:e_gouter_za/model/food.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class FoodApi {
  static Future<List<Food>> fetchFoods(String query) async {
    final jsonfood = await rootBundle.rootBundle.loadString('data/foods.json');
    final List foods = json.decode(jsonfood);
    return foods.map((json) => Food.fromJson(json)).where((food) {
      //convert into Book object
      final nameLower = food.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }
}
