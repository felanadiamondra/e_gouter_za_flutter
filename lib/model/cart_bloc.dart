import 'dart:async';
import 'package:e_gouter_za/model/cart.dart';
import 'package:e_gouter_za/model/food.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';
part 'cart_event.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());

  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartStarted) {
      yield* _mapCartStartedToState();
    } else if (event is CartFoodAdded) {
      yield* _mapFoodAddedToState(event, state);
    } else if (event is CartFoodRemoved) {
      yield* _mapFoodRemovedToState(event, state);
    }
  }

  Stream<CartState> _mapCartStartedToState() async* {
    yield CartLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield CartLoaded();
    }
    // ignore: empty_catches
    catch (_) {}
  }

  Stream<CartState> _mapFoodAddedToState(
      CartFoodAdded event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(foods: List.from(state.cart.foods)..add(event.food)));
      } catch (_) {}
    }
  }

  Stream<CartState> _mapFoodRemovedToState(
      CartFoodRemoved event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(foods: List.from(state.cart.foods)..remove(event.food)));
      } catch (_) {}
    }
  }
}
