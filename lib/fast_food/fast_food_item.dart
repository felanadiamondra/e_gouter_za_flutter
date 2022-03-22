import 'package:flutter/material.dart';

class FastFood extends StatefulWidget {
  const FastFood({Key? key}) : super(key: key);

  @override
  State<FastFood> createState() => _FastFoodState();
}

class _FastFoodState extends State<FastFood> {
  Widget categoriesFastFood({required String image, required String name}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          height: 100,
          width: 80,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image)),
              color: Colors.white70,
              borderRadius: BorderRadius.circular(30)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          categoriesFastFood(
              image: "images/gastro/logo.png", name: "Gastro"),
          categoriesFastFood(
              image: "images/extra/extra.jpg", name: "Extra"),
          categoriesFastFood(
              image: "images/extra/extra.jpg", name: "Happy King"),
          categoriesFastFood(image: "images/kfc/kfc.png", name: "Kfc"),
        ],
      ),
    );
  }
}
