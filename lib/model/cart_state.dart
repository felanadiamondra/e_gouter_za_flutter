part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  List<Object> get props => [];
}

class CartLoading extends CartState {
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final Cart cart;
  const CartLoaded({this.cart = const Cart()});
  List<Object> get props => [cart];
}

class CartError extends CartState {
  List<Object> get props => [];
}