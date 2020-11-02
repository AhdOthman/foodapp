import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../meal_item.dart';
import '../models/meal.dart';
import '../main.dart';

class CategoryMealsScreen extends StatefulWidget {
    static const routeName = '/Category_meal';
    final List<Meal> available;

    CategoryMealsScreen(this.available);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List <Meal> displaymeal;
  var isload = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
    if (!isload){
final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
     categoryTitle = routeArgs['title'];
    final id = routeArgs['id'];
     displaymeal = widget.available.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    isload = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealid){
     setState(() {
       displaymeal.removeWhere((meal) => meal.id== mealid);
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: displaymeal[index].id,
              affordable: displaymeal[index].affordable,
              complexity: displaymeal[index].complexity,
              duration: displaymeal[index].duration,
              imageUrl: displaymeal[index].imageUrl,
              title: displaymeal[index].title,
              removeitem: removeMeal,
              );
        },
        itemCount: displaymeal.length,
      ),
    );
  }
}
