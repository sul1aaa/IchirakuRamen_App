import 'package:flutter/material.dart';
import '../MealFactory.dart';

class MainDishesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> mainDishes = [
    {"name": "Ichiraku-Ramen", "description": "Original Ichiraku-Ramen", "image": "assets/ramen.jpg", "price": 4.50},
    {"name": "Burger", "description": "Juicy beef burger", "image": "assets/burger.jpeg", "price": 5.50},
    {"name": "Pizza", "description": "Delicious cheese pizza", "image": "assets/pizza.jpeg", "price": 7.00},
    {"name": "Pasta", "description": "Creamy Alfredo pasta", "image": "assets/pasta.jpeg", "price": 6.50},
  ];

  final MealFactory mealFactory = MealFactory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Dishes"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: mainDishes.length,
        itemBuilder: (context, index) {
          final dish = mainDishes[index];
          return mealFactory.createMealCard(
            dish["name"],
            dish["description"],
            dish["image"],
            dish["price"],
          );
        },
      ),
    );
  }
}
