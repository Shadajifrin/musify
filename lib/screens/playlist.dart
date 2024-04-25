import 'package:flutter/material.dart';
import 'package:musify/utils/color.dart';
import 'package:musify/utils/texttheme.dart';

class PlaylistPage extends StatelessWidget {
  // List of image URLs
  final List<String> imageUrls = [
    'https://tse2.mm.bing.net/th?id=OIP.OtSishzLcwXDaLg_nNjWjwHaHa&pid=Api&P=0&h=180',
    'https://tse3.mm.bing.net/th?id=OIP.OrT5gV9rzO-l6gRAz53gTwHaHa&pid=Api&P=0&h=180',
    'https://tse3.mm.bing.net/th?id=OIP.-o0JZhrwJnDfiulOqqZAbgHaHa&pid=Api&P=0&h=180',
    'https://tse3.mm.bing.net/th?id=OIP.SsRHmLRKbsAIOYxvV5uRbAHaHa&pid=Api&P=0&h=180',
    'https://tse1.mm.bing.net/th?id=OIP.oTaaAXlOdgFUyqLXyN1DrQHaHa&pid=Api&P=0&h=180',
    'https://tse1.mm.bing.net/th?id=OIP.UNbY_LP1k5eVSOnEyW1lrwHaHa&pid=Api&P=0&h=180',
    'https://tse2.mm.bing.net/th?id=OIP.odNQ7ttcUp19m0f_h-vdHQAAAA&pid=Api&P=0&h=180',
    'https://tse1.mm.bing.net/th?id=OIP.zwlMRB-7hkM1lbj_D9e9DQHaHa&pid=Api&P=0&h=180',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Playlists', style: MyTextThemes.textHeading)),
        backgroundColor: MyColors.basicColors,
      ),
         backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(20.0),
                 border: Border.all(color: MyColors.textColors, width: 2.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                
                children: [
                  Expanded(
                    child: Text(
                      'Search...',
                      style: TextStyle(color: MyColors.textColors, fontSize: 18),
                    ),
                  ),
                  Icon(Icons.search, color: MyColors.textColors, size: 30),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: List.generate(imageUrls.length, (index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: NetworkImage(imageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(Icons.home, "Home"),
            _buildNavItem(Icons.search, "Search"),
            _buildNavItem(Icons.bookmark, "Playlist", isSelected: true),
            _buildNavItem(Icons.menu, "More"),
          ],
        ),
        color: Colors.black,
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isSelected = false}) {
    return InkWell(
      onTap: () {
        // Handle navigation here
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: isSelected ? MyColors.textColors : Colors.grey,
          ),
          if (isSelected)
            Text(
              label,
              style: TextStyle(color: MyColors.textColors),
            )
        ],
      ),
    );
  }
}
