import 'package:flutter/material.dart';
import '../categories/DrinkScreen.dart';
import '../categories/MainDishesScreen.dart';
import '../categories/DessertsScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Order System"),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
          IconButton(
            icon: const Icon(Icons.list_alt),
            onPressed: () {
              Navigator.pushNamed(context, '/myOrders');
            },
          ),
        ],
      ),
      body: GridView(
        padding: const EdgeInsets.all(13.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 2,
          mainAxisSpacing: 10,
        ),
        children: [
          _buildCategoryCard(
            context,
            "Drinks",
            "assets/drink.jpeg",
            DrinksScreen(),
          ),
          _buildCategoryCard(
            context,
            "Main Dishes",
            "assets/maindish.jpeg",
            MainDishesScreen(),
          ),
          _buildCategoryCard(
            context,
            "Desserts",
            "assets/dessert.jpeg",
            DessertsScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String title, String imagePath, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
