import 'package:flutter/material.dart';
import '../managers/OrderManager.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = OrderManager.instance.getOrders();
    final totalPrice = OrderManager.instance.getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Colors.orange,
      ),
      body: orders.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final mealName = orders.keys.elementAt(index);
                final details = orders[mealName]!;
                return ListTile(
                  title: Text(mealName),
                  subtitle: Text(
                    'Quantity: ${details['quantity']} | '
                        'Total: \$${(details['quantity'] * details['price']).toStringAsFixed(2)}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      OrderManager.instance.removeOrder(mealName);
                      (context as Element).markNeedsBuild();
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Price: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            child: const Text("Place Order"),
            onPressed: () {
              OrderManager.instance.placeOrder();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Order placed! Preparing your order..."),
                ),
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
