import 'package:e_gouter_za/api/fastfood_api.dart';
import 'package:e_gouter_za/model/restaurant.dart';
import 'package:flutter/material.dart';

class FastFood extends StatefulWidget {
  const FastFood({Key? key}) : super(key: key);

  @override
  State<FastFood> createState() => _FastFoodState();
}

class _FastFoodState extends State<FastFood> {
  List<Restaurant> restos = [];

  Future init() async {
    final allresto = await FastFoodApi.getAllFastfood();
    setState(() {
      restos = allresto;
    });
  }

  Widget buildFastFoodItem(Restaurant resto) => Container(
        width: 100,
        height: 100,
        child: Column(
          children: <Widget>[
            Image.asset(resto.logourl),
            Text(resto.name)
            ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: restos.length,
          itemBuilder: (context, index) {
            final resto = restos[index];
            return buildFastFoodItem(resto);
          }),
    );
  }
}
