import 'dart:convert';
import 'package:e_gouter_za/model/restaurant.dart';
import 'package:flutter/services.dart' as rootBundle;

class FastFoodApi {
  static Future<List<Restaurant>> getAllFastfood() async {
    final jsonfastfood =
        await rootBundle.rootBundle.loadString('data/restaurant.json');
    final List fastfood = json.decode(jsonfastfood);
    return fastfood.map((json) => Restaurant.fromJson(json)).toList();
  }

}
