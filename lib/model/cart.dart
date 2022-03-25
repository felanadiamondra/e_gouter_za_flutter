import 'package:e_gouter_za/model/food.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Food> foods;
  const Cart({this.foods = const <Food>[]});
  double get total => foods.fold(0, (tot, current) => tot + current.price);

  String get totalString => total.toStringAsFixed(2);

  List<Object?> get props => [foods];
}
