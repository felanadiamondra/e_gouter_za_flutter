import 'package:e_gouter_za/model/cart.dart';
import 'package:e_gouter_za/model/food.dart';
import 'package:flutter/material.dart';

class FoodDetails extends StatelessWidget {
  final Food food;
  
  const FoodDetails({Key? key, required this.food}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 172, 28, 1),
      appBar: AppBar(
          // title: Text("E' GOUTER ZA"),
          ),
      body: Column(
        children: <Widget>[
          // Image.asset(food.url, height: size.height * 0.25,width: double.infinity, fit: BoxFit.cover,),
          Center(
            child: Image.asset(food.url, height: size.height * 0.35),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Column(
                        children: <Widget>[
                          Text(food.name,
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber))
                        ],
                      ))
                    ],
                  ),
                  Text(
                    food.descri,
                    style: TextStyle(height: 1.5),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: size.width * 0.7,
                    child: FloatingActionButton.extended(
                        onPressed: () => { }, label: const Text('Commander')),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
