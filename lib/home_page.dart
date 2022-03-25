import 'package:badges/badges.dart';
import 'package:e_gouter_za/body.dart';
import 'package:e_gouter_za/menu/commande.dart';
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
          Badge(
            position: BadgePosition(top: 0, end: 1),
            animationDuration: Duration(milliseconds: 200),
            animationType: BadgeAnimationType.scale,
            showBadge: true,
            badgeColor: Colors.red,
            badgeContent: Text(
              '0', style: TextStyle(
                color: Colors.white
              ),
            ),
            child: IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Commande())),
            icon: Icon(Icons.shopping_cart),
           ),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: const Body()
     
      ); 
  }
}

