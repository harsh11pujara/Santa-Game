import 'dart:async';

import 'package:flame/components.dart';
import 'package:santa_game/Constants/globals.dart';
import 'package:santa_game/Game/santa_game.dart';

class BackgroundComponent extends SpriteComponent with HasGameRef<SantaGame>{
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.backgroundSprite);
    size = gameRef.size;
  }
}