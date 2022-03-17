import 'package:e_gouter_za/model/food.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodApi {
  static Future<List<Food>> fetchFoods(String query) async {
    final url = Uri.parse('data/foods.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List foods = json.decode(response.body); //return list of json object data
      return foods.map((json) => Food.fromJson(json)).where((food) {  //convert into Book object
        final nameLower = food.name.toLowerCase();
        final queryLower = query.toLowerCase();
        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
