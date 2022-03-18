import 'package:flutter/material.dart';

class Commande extends StatelessWidget {
  const Commande({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vos commandes'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
    );
  } 
}
