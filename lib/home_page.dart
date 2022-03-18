import 'package:e_gouter_za/body.dart';
import 'package:e_gouter_za/navigation_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text("E' GOUTER ZA"),
      ),
      body: const Body()
     
      ); 
  }
}

