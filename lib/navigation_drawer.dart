import 'package:e_gouter_za/home_page.dart';
import 'package:e_gouter_za/menu/commande.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 10);
  // const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
          color: Colors.orange,
          child: ListView(
            padding: padding,
            children: <Widget>[
              const SizedBox(height: 48),
              buildMenuItem(
                  text: 'Accueil',
                  icon: Icons.home,
                  onClicked: () => selectedItem(context, 0)),
              const SizedBox(height: 16),
              buildMenuItem(
                  text: 'Commande',
                  icon: Icons.people,
                  onClicked: () => selectedItem(context, 1)),
              const SizedBox(height: 16),
              buildMenuItem(
                  text: 'Statistiques',
                  icon: Icons.people,
                  onClicked: () => selectedItem(context, 2)),
            ],
          )),
    );
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final color = Colors.white;
    final hovercolor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hovercolor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Commande(),
        ));
    }
  }
}
