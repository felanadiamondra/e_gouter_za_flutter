import 'package:flutter/material.dart';

class FoodOrder extends StatelessWidget {
  const FoodOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vos commandes'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
    );
  } 
}
