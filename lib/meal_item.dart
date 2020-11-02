import 'package:flutter/material.dart';
import 'models/meal.dart';
import 'screens/meal_detail.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordable affordable;
  final Function removeitem;

  MealItem(
      {@required this.id,
      @required this.affordable,
      @required this.complexity,
      @required this.duration,
      @required this.imageUrl,
      @required this.title,
      @required this.removeitem});

  void selected(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      DetailMeal.routename,
      arguments: id,
    ).then((result) {
if (result != null){
  removeitem(result);
}
    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Simple:
        return 'simple';
        break;
      case Complexity.Challengable:
        return 'Challengable';
        break;
        defult:
        'NOON';
    }
  }

  String get affordableText {
    switch (affordable) {
      case Affordable.Afford:
        return 'Afford';
        break;
      case Affordable.Luxury:
        return 'Luxury';
        break;
      case Affordable.Pricey:
        return 'Pricey';
        break;
        defult:
        'NOON';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selected(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover)),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    width: 220,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 10,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 10,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 10,
                      ),
                      Text(affordableText),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
