import 'package:flutter/material.dart';
import '../MealFactory.dart';

class DrinksScreen extends StatelessWidget {
  final List<Map<String, dynamic>> drinks = [
    {"name": "Naruto Bubble-tea", "description": "Refreshing naruto bubble tea", "image": "assets/drinknaruto.jpeg", "price": 2.50},
    {"name": "Coca-Cola", "description": "Refreshing soda", "image": "assets/coke.jpeg", "price": 1.50},
    {"name": "Fanta", "description": "Orange-flavored soda", "image": "assets/fanta.jpeg", "price": 1.40},
    {"name": "Sprite", "description": "Lemon-lime soda", "image": "assets/sprite.jpeg", "price": 1.30},
  ];

  final MealFactory mealFactory = MealFactory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drinks"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          final drink = drinks[index];
          return mealFactory.createMealCard(
            drink["name"],
            drink["description"],
            drink["image"],
            drink["price"],
          );
        },
      ),
    );
  }
}
