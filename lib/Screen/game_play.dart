import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:santa_game/Game/santa_game.dart';
import 'package:santa_game/Screen/game_over_screen.dart';

class GamePlay extends StatelessWidget {
  GamePlay({Key? key}) : super(key: key);

  final SantaGame gameRef = SantaGame();

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: gameRef, overlayBuilderMap: {
      GameOverScreen.id: (BuildContext context, SantaGame gameRef) => GameOverScreen(
            gameRef: gameRef,
          )
    });
  }
}
