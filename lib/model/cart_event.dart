part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  List<Object> get props => [];
}

class CartStarted extends CartEvent {
  List<Object> get props => [];
}

class CartFoodAdded extends CartEvent {
  final Food food;
  const CartFoodAdded(this.food);
  List<Object> get props => [food];
}
 
class CartFoodRemoved extends CartEvent {
  final Food food;
  const CartFoodRemoved(this.food);
  List<Object> get props => [food];
}
