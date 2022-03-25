import 'package:e_gouter_za/food_page/food_details.dart';
import 'package:e_gouter_za/model/cart.dart';
import 'package:e_gouter_za/model/food.dart';
import 'package:flutter/material.dart';

class FoodOrder extends StatefulWidget {
  const FoodOrder({Key? key}) : super(key: key);

  @override
  State<FoodOrder> createState() => _FoodOrderState();
}

class _FoodOrderState extends State<FoodOrder> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vos commandes"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: ListTile(
              title: Text('Total:'),
              subtitle: Text("10000 Ar"),
            )),
            Expanded(
                child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Se faire livrer",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.amber,
            ))
          ],
        ),
      ),
    );
  }
}
