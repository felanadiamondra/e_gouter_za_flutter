import 'package:e_gouter_za/body.dart';
import 'package:e_gouter_za/menu/food_order.dart';
import 'package:e_gouter_za/navigation_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: const Text("E' GOUTER ZA"),
        actions:<Widget>[
          IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FoodOrder())),
            icon: Icon(Icons.shopping_cart),
           ),
        ],
      ),
      body: const Body()
     
      ); 
  }
}

