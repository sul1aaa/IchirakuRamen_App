// Global variable for booking history
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BookingHistoryScreen.dart';

List<Map<String, String>> globalBookingHistory = [];

class BookPlaceScreen extends StatefulWidget {
  @override
  _BookPlaceScreenState createState() => _BookPlaceScreenState();
}

class _BookPlaceScreenState extends State<BookPlaceScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController peopleController = TextEditingController();

  void confirmBooking() {
    final name = nameController.text;
    final phone = phoneController.text;
    final date = dateController.text;
    final time = timeController.text;
    final people = peopleController.text;

    if (name.isEmpty || phone.isEmpty || date.isEmpty || time.isEmpty || people.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please fill in all fields to confirm your booking.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      globalBookingHistory.add({
        'name': name,
        'phone': phone,
        'date': date,
        'time': time,
        'people': people,
      });
    });

    nameController.clear();
    phoneController.clear();
    dateController.clear();
    timeController.clear();
    peopleController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Booking Confirmed'),
        content: Text('Your booking has been confirmed!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book a Place'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingHistoryScreen(globalBookingHistory),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/booook.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      labelText: 'Date (e.g., DD/MM/YYYY)',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: timeController,
                    decoration: InputDecoration(
                      labelText: 'Time (e.g., HH:MM)',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: peopleController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Number of People',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: confirmBooking,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 180),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
