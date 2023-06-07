import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:santa_game/Game/santa_game.dart';
import 'package:santa_game/Screen/main_screen.dart';


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}
