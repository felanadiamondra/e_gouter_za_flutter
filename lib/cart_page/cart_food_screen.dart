import 'package:e_gouter_za/model/cart_bloc.dart';
import 'package:e_gouter_za/model/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartFoodScreen extends StatelessWidget {
  const CartFoodScreen({Key? key, required this.food}) : super(key: key);
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.asset(
            food.url,
            width: 150,
            height: 100,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(food.name),
                Text('${food.price.toString()} Ar'),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartFoodRemoved(food));
                    },
                    icon: Icon(Icons.highlight_remove_rounded))
              ],
            );
          }),
        ],
      ),
    );
  }
}
