import 'package:flutter/material.dart';
import 'package:player_video/views/screens/Burj_khalifa_.dart';
import 'package:player_video/views/screens/Cricket_video.dart';
import 'package:player_video/views/screens/flower.dart';
import 'package:player_video/views/screens/homepage.dart';
import 'package:player_video/views/screens/mountain.dart';
import 'package:player_video/views/screens/ronaldo.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => HomePage(),
      'cricket' : (context) => video(),
      'montain' : (context) => Mountain(),
      'flower' : (context) => flower(),
      'burj' : (context) => burj(),
      'ronaldo' : (context) => Ronaldo(),
    },
  ));
}