import 'package:flutter/material.dart';
import 'package:musify/screens/nowplaying.dart';
//import 'package:musify/screens/playlist.dart';
//import 'package:musify/screens/third.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NowPlayingPage(),
      // routes: {
        
       
      //   '/playlist': (context) => PlaylistPage(),
      // },
      
     
    );
  }

}