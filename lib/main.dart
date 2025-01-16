import 'package:flutter/material.dart';
import 'package:flutter_folder/screens/BonusScreen.dart';
import 'package:flutter_folder/screens/BookPlaceScreen.dart';
import 'package:flutter_folder/screens/WelcomeScreen.dart';
import 'screens/HomeScreen.dart';
import 'screens/CartScreen.dart';
import 'screens/MyOrdersScreen.dart';

void main() {
  runApp(MealOrderApp());
}

class MealOrderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Order System',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/cart': (context) => CartScreen(),
        '/myOrders': (context) => MyOrdersScreen(),
        '/bookPlace': (context) => BookPlaceScreen(),
        '/bonus': (context) => BonusScreen(),
      },
    );
  }
}
