import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:e_gouter_za/model/food.dart';

List<Food> parseFood(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var foods = list.map((food) => Food.fromJson(food)).toList();
  return foods;
}

Future<List<Food>> fetchFoods() async {
  final url = Uri.parse('data/foods.json');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return compute(parseFood, response.body);
  } else {
    throw Exception("Request API Error");
  }  
}
