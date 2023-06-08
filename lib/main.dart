import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:santa_game/Game/santa_game.dart';
import 'package:santa_game/Screen/main_screen.dart';
import 'package:device_preview/device_preview.dart';


void main() {
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}



