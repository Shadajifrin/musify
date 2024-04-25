import 'package:flutter/material.dart';
import 'package:musify/utils/color.dart';
import 'package:musify/utils/texttheme.dart';

class NowPlayingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_downward,color: MyColors.textColors,),
              onPressed: () {
                // Handle arrow button press
              },
            ),
            Center(child: Text('Now Playing',style: MyTextThemes.textHeading,)),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 400,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  'https://tse1.mm.bing.net/th?id=OIP.-vD3YberjT_47_CU1xJ52QHaHa&pid=Api&P=0&h=180', // Replace with your song image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Text(
                  'Flowers',
                  style: TextStyle(fontSize: 24,color: MyColors.textColors),
                ),
                Text(
                  'Miley Cyrus',
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          LinearProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(MyColors.textColors), // Change color as needed
            value: 0.5, // Replace with the actual progress value (0.0 to 1.0)
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '00:00', // Replace with current position
                style: TextStyle(fontSize: 14,color:  MyColors.textColors),
              ),
              Text(
                '04:32', // Replace with song duration
                style: TextStyle(fontSize: 14,color: MyColors.textColors),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () {
                  // Handle skip previous button press
                },
              ),
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  // Handle play button press
                },
              ),
              IconButton(
                icon: Icon(Icons.pause),
                onPressed: () {
                  // Handle pause button press
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {
                  // Handle skip next button press
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
