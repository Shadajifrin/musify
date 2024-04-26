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
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Suggested Playlist',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: MyColors.textColors),
              ),
            ),
            Container(
              height: 150, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: suggestedPlaylists.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      suggestedPlaylists[index]['imageUrl'],
                      width: 150, // Adjust width as needed
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Recommended for You',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:MyColors.textColors),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recommendedContent.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.grey[900],
                  leading: Image.network(
                    recommendedContent[index]['imageUrl'],
                    width: 80, // Adjust width as needed
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    recommendedContent[index]['title'],
                    style: TextStyle(color: MyColors.textColors),
                  ),
                  subtitle: Text(
                    recommendedContent[index]['subtitle'],
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle left icon press
                        },
                        icon: Icon(
                          recommendedContent[index]['leftIcon'],
                          color: MyColors.textColors,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle right icon press
                        },
                        icon: Icon(
                          recommendedContent[index]['rightIcon'],
                          color: MyColors.textColors,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
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
}

// Mock data, replace it with your actual data
final List<Map<String, dynamic>> suggestedPlaylists = [
  {
    'imageUrl': 'https://tse3.mm.bing.net/th?id=OIP.-o0JZhrwJnDfiulOqqZAbgHaHa&pid=Api&P=0&h=180',
  },
  {
    'imageUrl': 'https://tse3.mm.bing.net/th?id=OIP.SsRHmLRKbsAIOYxvV5uRbAHaHa&pid=Api&P=0&h=180',
  },
  {
    'imageUrl': 'https://tse1.mm.bing.net/th?id=OIP.UNbY_LP1k5eVSOnEyW1lrwHaHa&pid=Api&P=0&h=180',
  },
];

// Mock data, replace it with your actual data
final List<Map<String, dynamic>> recommendedContent = [
  {
    'imageUrl': 'https://tse4.mm.bing.net/th?id=OIP.CIHuZabcWTnD2BFyYpSLGAHaE6&pid=Api&P=0&h=180',
    'title': 'Hero',
    'subtitle': 'Taylor Swift',
    'leftIcon': Icons.star_border_outlined,
    'rightIcon': Icons.download_outlined,
  },
  {
    'imageUrl': 'https://tse4.mm.bing.net/th?id=OIP.ArmDVeUU7CPgr-dkBes8JwAAAA&pid=Api&P=0&h=180',
    'title': 'Unholy',
    'subtitle': 'Sam Smith,Kim Petras',
    'leftIcon': Icons.star_border_outlined,
    'rightIcon': Icons.download_outlined,
  },
  {
    'imageUrl': 'https://tse3.mm.bing.net/th?id=OIP.oYJpVlU4uskSbqQSoycNWQHaE5&pid=Api&P=0&h=180',
    'title': 'Lift Me Up',
    'subtitle': 'Rihanna',
    'leftIcon': Icons.star_border_outlined,
    'rightIcon': Icons.download_outlined,
  },
   {
    'imageUrl': 'https://tse3.mm.bing.net/th?id=OIP.MdjLRKddMYdnjorgJRS43gHaEK&pid=Api&P=0&h=180',
    'title': 'Depression',
    'subtitle': 'Dax',
    'leftIcon': Icons.star_border_outlined,
    'rightIcon': Icons.download_outlined,
  },
  {
    'imageUrl': 'https://tse1.mm.bing.net/th?id=OIP.BQ4uFtosYWJNq46vMmLmzAHaEK&pid=Api&P=0&h=180',
    'title': 'Im Good',
    'subtitle': 'David Guetta & Bebe Rehxa',
    'leftIcon': Icons.star_border_outlined,
    'rightIcon': Icons.download_outlined,
  },
  {
    'imageUrl': 'https://tse3.mm.bing.net/th?id=OIP.oYJpVlU4uskSbqQSoycNWQHaE5&pid=Api&P=0&h=180',
    'title': 'Lift Me Up',
    'subtitle': 'Rihanna',
    'leftIcon': Icons.star_border_outlined,
    'rightIcon': Icons.download_outlined,
  },
 {
    'imageUrl': 'https://tse3.mm.bing.net/th?id=OIP.oYJpVlU4uskSbqQSoycNWQHaE5&pid=Api&P=0&h=180',
    'title': 'Lift Me Up',
    'subtitle': 'Rihanna',
    'leftIcon': Icons.star_border_outlined,
    'rightIcon': Icons.download_outlined,
  },
   {
    'imageUrl': 'https://tse3.mm.bing.net/th?id=OIP.MdjLRKddMYdnjorgJRS43gHaEK&pid=Api&P=0&h=180',
    'title': 'Depression',
    'subtitle': 'Dax',
    'leftIcon': Icons.star_border_outlined,
    'rightIcon': Icons.download_outlined,
  },
  {
    'imageUrl': 'https://tse1.mm.bing.net/th?id=OIP.BQ4uFtosYWJNq46vMmLmzAHaEK&pid=Api&P=0&h=180',
    'title': 'Im Good',
    'subtitle': 'David Guetta & Bebe Rehxa',
    'leftIcon': Icons.star_border_outlined,
    'rightIcon': Icons.download_outlined,
  },
];
