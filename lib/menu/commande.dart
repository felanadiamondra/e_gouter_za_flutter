import 'package:flutter/material.dart';

class Commande extends StatelessWidget {
  const Commande({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vos commandes'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      bottomNavigationBar:  Container(
        color: Colors.white,
        child: Row(children: [
          Expanded(child: ListTile(
            title : Text('Total:'),
            subtitle: Text("10000 Ar"),
            )),
            Expanded(child: MaterialButton(
              onPressed: (){},
              child: Text("Se faire livrer", 
              style: TextStyle(
                color: Colors.white
              ),),
              color: Colors.amber,))
        ],),
      ),
    );
  } 
}
