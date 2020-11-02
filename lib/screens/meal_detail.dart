import 'package:flutter/material.dart';
import '../meal_item.dart';
import '../dummy_data.dart';

class DetailMeal extends StatelessWidget {
  static const routename = '/meal-detail';
 
  Widget buildTitle(BuildContext context, String text) {
    return Container(
        child: Text(
      text,
      style: Theme.of(context).textTheme.title,
    ));
  }

  Widget buildcontainer(Widget child) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    print("-----here-----");
    final mealid = ModalRoute.of(context).settings.arguments as String;
        print("-----here-----");

    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => mealid == meal.id);
    print(selectedmeal);
    return Scaffold(
        appBar: AppBar(title: Text(selectedmeal.title)),
        
        body: SingleChildScrollView(
                  child: Column(
            children:<Widget> [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 300,
                width: double.infinity,
                child: Image.network(selectedmeal.imageUrl, fit: BoxFit.cover),
              ),
              buildTitle(context, 'ingredients'),
              buildcontainer(ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.yellow,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedmeal.ingredients[index])),
                ),
                itemCount: selectedmeal.ingredients.length,
              )),
             
              buildTitle(context, 'steps'),
              buildcontainer(
                  ListView.builder(itemBuilder: (ctx, index) => 
                  Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('# ${(index +1)}') ),
                        title: Text(selectedmeal.steps[index]),
                      ),Divider()
                    ],
                  )
              ,
                  )
                  ),

            ],
            
          ),
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.delete),
         onPressed: (){
        Navigator.of(context).pop(mealid);
        }
        ,),);
                       

        
  }
}
