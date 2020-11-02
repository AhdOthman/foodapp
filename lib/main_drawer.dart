import 'package:flutter/material.dart';
import './screens/filters.dart';

class MainDrawer extends StatelessWidget {
  Widget buildlist(IconData icon, String title, Function onhand) {
   return ListTile(
      leading: Icon(
      icon,
        size: 26,
      ),
      title: Text(title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold)),
              onTap: onhand,
    );
  }
 static const routname= '/main_drawer';
 
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          color: Theme.of(context).accentColor,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(16),
          child: Text('Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor)),
        ),
        SizedBox(height: 20),
        buildlist(Icons.restaurant_menu_sharp, 'Meals', (){
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildlist(Icons.settings, 'Filters', (){
Navigator.of(context).pushReplacementNamed( FiltersScreen.routeName);
        })
      ]),
    );
  }
}
