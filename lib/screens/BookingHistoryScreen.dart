import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> bookingHistory;

  BookingHistoryScreen(this.bookingHistory);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking History'),
        backgroundColor: Colors.orange,
      ),
      body: bookingHistory.isEmpty
          ? Center(
        child: Text(
          'No bookings yet!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        itemCount: bookingHistory.length,
        itemBuilder: (context, index) {
          final booking = bookingHistory[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text('${booking['name']}'),
              subtitle: Text(
                'Phone: ${booking['phone']}\n'
                    'Date: ${booking['date']} at ${booking['time']}\n'
                    'People: ${booking['people']}',
              ),
            ),
          );
        },
      ),
    );
  }
}
