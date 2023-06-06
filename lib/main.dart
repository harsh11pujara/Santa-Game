import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:santa_game/Components/background_component.dart';
import 'package:santa_game/Components/gift_componennt.dart';
import 'package:santa_game/Components/ice_component.dart';
import 'package:santa_game/Components/santa_component.dart';
import 'package:santa_game/Constants/globals.dart';
import 'package:santa_game/Input/joystick_component.dart';

void main() {
  runApp(GameWidget(game: SantaGame()));
}

class SantaGame extends FlameGame with HasCollisionDetection {
  @override
  Future<void> onLoad() async{
    await super.onLoad();
    // collisionDetection = CollisionDetection();

    add(BackgroundComponent());
    add(SantaComponent(joystick: joystick));
    add(GiftComponent());
    add(IceComponent());
    add(IceComponent());
    add(joystick);

    collisionDetection;

    await FlameAudio.audioCache.loadAll([
      Globals.giftGrabSound,
      Globals.freezeSound
    ]);
  }
}
