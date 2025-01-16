import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ichiraku-Ramen'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/welcome1.png', // Replace with your image path
              fit: BoxFit.cover, // Cover the entire background
            ),
          ),

          // Content on top of the image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.withOpacity(0.9),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(horizontal: 89, vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Make Order'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the Book Place screen
                    Navigator.pushNamed(context, '/bookPlace');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.withOpacity(0.9),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Book Place'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Info'),
                          content: Text('"Welcome to Ichiraku Ramen – the place where every guest feels at home. Enjoy our legendary ramen, crafted with traditional recipes that bring the warmth and soul of Japan to your table. Each bowl here is a little journey into the world of flavor and harmony!" 😊'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.withOpacity(0.9),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(horizontal: 115, vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Info'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/bonus');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.withOpacity(0.9),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(horizontal: 108, vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Bonus'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
