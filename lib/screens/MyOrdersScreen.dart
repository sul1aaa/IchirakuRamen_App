import 'package:flutter/material.dart';
import '../managers/OrderManager.dart';

class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myOrders = OrderManager.instance.getMyOrders();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        backgroundColor: Colors.orange,
      ),
      body: myOrders.isEmpty
          ? const Center(child: Text("You have no orders yet"))
          : ListView.builder(
        itemCount: myOrders.length,
        itemBuilder: (context, index) {
          final order = myOrders[index];
          return ListTile(
            title: Text(order['mealName']),
            subtitle: Text('Quantity: ${order['quantity']}'),
            trailing: Text(
              'Status: ${order['status']}',
              style: TextStyle(
                color: order['status'] == 'Ready' ? Colors.green : Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
