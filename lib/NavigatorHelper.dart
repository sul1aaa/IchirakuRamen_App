import 'package:flutter/material.dart';
import 'screens/OrderSummaryScreen.dart';

class NavigatorHelper {
  static void goToOrderSummary(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderSummaryScreen()),
    );
  }
}

/*The NavigatorHelper class acts as a facade for the Navigator class in Flutter.*/
