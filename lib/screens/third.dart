import 'package:flutter/material.dart';
import 'package:musify/utils/color.dart';
import 'package:musify/utils/texttheme.dart';

class Musify3 extends StatefulWidget {
  const Musify3({Key? key}) : super(key: key);

  @override
  State<Musify3> createState() => _Musify3State();
}

class _Musify3State extends State<Musify3> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 1: // Search
        Navigator.pushNamed(context, '/search');
        break;
      case 2: // Playlist
        Navigator.pushNamed(context, '/playlist');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.basicColors,
        title: Center(child: Text("Musify.", style: MyTextThemes.textHeading)),
      ),
      body: _buildPage(_currentIndex),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(Icons.home, "Home", 0),
            _buildNavItem(Icons.search, "Search", 1),
            _buildNavItem(Icons.bookmark, "Playlist", 2),
            _buildNavItem(Icons.menu, "More", 3),
          ],
        ),
        color: Colors.black,
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: _currentIndex == index ? MyColors.textColors : Colors.grey,
          ),
          if (_currentIndex == index)
            Text(
              label,
              style: TextStyle(color: MyColors.textColors),
            )
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0: // Home
        return Container(child: Center(child: Text('Home Page')));
      case 1: // Search
        return Container(child: Center(child: Text('Search Page')));
      case 2: // Playlist
        return Container(child: Center(child: Text('Playlist Page')));
      case 3: // More
        return Container(child: Center(child: Text('More Page')));
      default:
        return Container();
    }
  }
}
