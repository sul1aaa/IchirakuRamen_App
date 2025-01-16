import 'package:flutter/material.dart';
import '../MealFactory.dart';

class DessertsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> desserts = [
    {"name": "Itachi's dango", "description": "Original Itachi's dango with 3 different flavors", "image": "assets/dango.jpeg", "price": 5.20},
    {"name": "Vanilla Ice Cream", "description": "Creamy vanilla ice cream", "image": "assets/icecream.jpeg", "price": 3.20},
    {"name": "Brownie", "description": "Chocolate fudge brownie", "image": "assets/brownie.jpeg", "price": 2.50},
    {"name": "Cheesecake", "description": "Rich cheesecake slice", "image": "assets/cheesecake.jpeg", "price": 4.00},
  ];

  final MealFactory mealFactory = MealFactory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desserts"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: desserts.length,
        itemBuilder: (context, index) {
          final dessert = desserts[index];
          return mealFactory.createMealCard(
            dessert["name"],
            dessert["description"],
            dessert["image"],
            dessert["price"],
          );
        },
      ),
    );
  }
}
