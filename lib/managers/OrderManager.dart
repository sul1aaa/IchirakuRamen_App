class OrderManager {
  static final OrderManager instance = OrderManager._privateConstructor();
  OrderManager._privateConstructor();

  final Map<String, Map<String, dynamic>> _orders = {};
  final List<Map<String, dynamic>> _myOrders = [];

  // Function to simulate order notifications
  void _simulateNotification({
    required String title,
    required String body,
  }) {
    print('$title: $body');
  }

  void addToCart(String mealName, double price) { // Command
    _orders.update(
      mealName,
          (details) => {
        'quantity': details['quantity'] + 1,
        'price': price,
      },
      ifAbsent: () => {'quantity': 1, 'price': price},
    );
  }

  void placeOrder() { // Command
    _orders.forEach((mealName, details) {
      _myOrders.add({
        'mealName': mealName,
        'quantity': details['quantity'],
        'status': 'Pending', // State
      });

      // Simulate order status change after 30 seconds
      // it is simulated Observer
      Future.delayed(const Duration(seconds: 30), () {
        _updateOrderStatus(mealName, 'Ready');
      });
    });

    clearCart();
  }

  void _updateOrderStatus(String mealName, String newStatus) async {
    for (var order in _myOrders) {
      if (order['mealName'] == mealName) {
        order['status'] = newStatus;

        // Simulate sending a notification when the order is ready
        // Simulated Observer
        _simulateNotification(
          title: 'Order Ready',
          body: 'Your order for $mealName is ready!',
        );
        break;
      }
    }
  }

  void removeOrder(String mealName) {
    if (_orders.containsKey(mealName)) {
      final currentQuantity = _orders[mealName]!['quantity'];
      if (currentQuantity > 1) {
        _orders[mealName]!['quantity'] -= 1;
      } else {
        _orders.remove(mealName);
      }
    }
  }

  void clearCart() => _orders.clear();

  Map<String, Map<String, dynamic>> getOrders() => Map.unmodifiable(_orders);
  List<Map<String, dynamic>> getMyOrders() => List.unmodifiable(_myOrders);

  // Multiplies each item’s quantity by its price and sums them up.
  double getTotalPrice() => _orders.entries.fold(
    0.0,
        (total, entry) =>
    total + (entry.value['quantity'] * entry.value['price']),
  );

  // Currently, it just prints a message.
  void initialize() {
    // No need for notification initialization anymore
    print('OrderManager initialized');
  }
}

