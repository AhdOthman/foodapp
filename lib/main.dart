import 'package:flutter/material.dart';
import 'package:foodapp/screens/tabs_screen.dart';
import './screens/tabs_screen.dart';
import './screens/bottombar.dart';
import 'screens/Category_meal.dart';
import './screens/meal_detail.dart';
import './screens/filters.dart';
import './dummy_data.dart';
import './models/meal.dart';
void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
} 

class _MyappState extends State<Myapp> {
  Map<String, bool> filters={
'gluten': false,
'lactose': false,
'vegan': false,
'vegetarian': false,
  };
  List<Meal> availablemeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> filterdata){
setState(() {
  filters =filterdata;

availablemeals = DUMMY_MEALS.where((meal){
if(filters['gluten'] && !meal.isGlutenFree){
  return false;
}
if(filters['lactose'] && !meal.isLactoseFree){
  return false;
}
if(filters['vegan'] && !meal.isVegan){
  return false;
}
if(filters['vegetarian'] && !meal.isVegetarian){
  return false;
}
return true;
}).toList();
});
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(primarySwatch: 
      Colors.pink,
      accentColor: Colors.amber,
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
        body1: TextStyle (color: Color.fromRGBO(20, 51, 51, 1), ),
      title: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: 20,
        fontWeight: FontWeight.bold
      )
      ),
    
      ),
      // home: CategoriesScreen(),
      routes:{
        '/': (ctx)=> BottomBar(),
        CategoryMealsScreen.routeName: (ctx)=> CategoryMealsScreen(availablemeals),
        DetailMeal.routename: (ctx)=> DetailMeal()
        ,FiltersScreen.routeName: (ctx)=> FiltersScreen(filters,setFilters)
      } ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DeliMeals')),
      body: Text('Nav'),
                                    

    );
  }
}
