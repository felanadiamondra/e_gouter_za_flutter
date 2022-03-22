import 'package:e_gouter_za/model/food.dart';
import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  List<Food> foods = [];

  double get total {
    return foods.fold(0.0, (double currentTotal, Food food) {
      return currentTotal + food.price;
    });
  }

  void addToCart(Food food) => foods.add(food);

  void removeFromCart(Food food) {
    foods.remove(food);
    notifyListeners();
  }
}
