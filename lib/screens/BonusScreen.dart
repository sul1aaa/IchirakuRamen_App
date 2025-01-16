import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BonusScreen extends StatefulWidget {
  @override
  _BonusScreenState createState() => _BonusScreenState();
}

class _BonusScreenState extends State<BonusScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video player
    _controller = VideoPlayerController.asset('assets/video1.mp4')
      ..initialize().then((_) {
        setState(() {}); // Refresh the UI when the video is loaded
      })
      ..setLooping(true) // Set the video to loop
      ..play(); // Automatically start playing
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller to release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bonus Screen'),
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: [
          // Video Player that fills the screen
          Positioned.fill(
            child: _controller.value.isInitialized
                ? FittedBox(
              fit: BoxFit.cover, // Ensures the video covers the entire screen.
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            )
                : Center(
              child: CircularProgressIndicator(),
            ),
          ),

          // Text Overlay
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.orange,
              width: 50.0,
              height: 80.0,
              child: Text('Bissenbay Tr pls give us 4 bonus points :)',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,),
            ),
          ),
        ],
      ),
    );
  }
}
