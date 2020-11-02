import 'package:flutter/material.dart';
import 'package:foodapp/screens/categori_screens.dart';
import 'package:foodapp/screens/favorites.dart';
import 'package:foodapp/screens/filters.dart';
import '../main_drawer.dart';
import 'package:flutter/services.dart';


class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Map<String, Object>> pages = [
    {'page': CategoriesScreen(), 'title': 'Category'},
    {'page': Favorites(), 'title': 'Favorites'},
  
  ];
  int selectedpageindex = 0;
  void selectedPage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[selectedpageindex]['title'])),
      drawer: MainDrawer(),
      body: pages[selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: selectedPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Category')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favorites')),
                      

        ],
        currentIndex: selectedpageindex,
        selectedItemColor:Theme.of(context).accentColor ,
        unselectedItemColor: Colors.white,
      ),
    
    );
  }
}
