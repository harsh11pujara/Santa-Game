import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:santa_game/Components/background_component.dart';
import 'package:santa_game/Components/gift_componennt.dart';
import 'package:santa_game/Components/ice_component.dart';
import 'package:santa_game/Components/santa_component.dart';
import 'package:santa_game/Game/santa_game.dart';
import 'package:santa_game/Input/joystick_component.dart';
import 'package:santa_game/Screen/game_over_screen.dart';

class GamePlay extends StatefulWidget {
  GamePlay({Key? key}) : super(key: key);

  @override
  State<GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  SantaGame gameRef = SantaGame();

  @override
  void dispose() {
    super.dispose();
    print("removing");

    gameRef.remove(BackgroundComponent());
    gameRef.remove(SantaComponent(joystick: joystick));
    gameRef.remove(GiftComponent());
    gameRef.remove(IceComponent());
    gameRef.remove(IceComponent());
    gameRef.remove(ScreenHitbox());
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: gameRef, overlayBuilderMap: {
      GameOverScreen.id: (BuildContext context, SantaGame gameRef) => GameOverScreen(
            gameRef: gameRef,
          )
    });
  }
}
