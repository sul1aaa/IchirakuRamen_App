import 'package:flutter/material.dart';
import '../managers/OrderManager.dart';

class OrderSummaryScreen extends StatefulWidget {
  @override
  _OrderSummaryScreenState createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    // Use the public getter to access orders
    final orders = OrderManager.instance.getOrders();

    return Scaffold(
      appBar: AppBar(
        title: Text("Order Summary"),
      ),
      body: orders.isEmpty
          ? Center(child: Text("No orders available"))
          : ListView(
        children: orders.entries
            .map((entry) {
          // Assuming entry.key is the meal name and entry.value is the meal details
          return ListTile(
            title: Text(entry.key), // meal name
            subtitle: Text(entry.value['description'] ?? 'No description'), // description
          );
        })
            .toList(),
      ),
    );
  }
}
