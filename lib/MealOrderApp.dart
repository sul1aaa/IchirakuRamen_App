import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';
import 'managers/OrderManager.dart';

class MealOrderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize OrderManager
    OrderManager.instance.initialize();
    /*The OrderManager.instance.initialize()
     call ensures the singleton is properly initialized
     before the app runs.
     */

    return MaterialApp(
      title: 'Meal Order System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
    /*(Facade) Encapsulates setup logic for the application
     (e.g., theme and initialization of OrderManager)
     and connects it to the main widget tree.
     */
  }
}

void main() {
  runApp(MealOrderApp());
}
