import 'package:santa_game/Components/background_component.dart';
import 'package:santa_game/Components/gift_componennt.dart';
import 'package:santa_game/Components/ice_component.dart';
import 'package:santa_game/Components/santa_component.dart';
import 'package:santa_game/Constants/globals.dart';
import 'package:santa_game/Input/joystick_component.dart';
import 'dart:async';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:santa_game/Screen/game_over_screen.dart';


class SantaGame extends FlameGame with HasCollisionDetection {
  late Timer timer;
  int remainingTime = 30;
  int score = 0;
  late TextComponent scoreComponent;
  late TextComponent time;

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    // collisionDetection = CollisionDetection();
    add(BackgroundComponent());
    add(SantaComponent(joystick: joystick));
    add(GiftComponent());
    add(IceComponent());
    add(IceComponent());
    add(ScreenHitbox());
    add(joystick);

    scoreComponent = TextComponent(
      text: "Score: $score",
      position: Vector2(size.x/2 - size.x/3.5,40),
      anchor: Anchor.topCenter,
      textRenderer: TextPaint(style: const TextStyle(fontSize: 35, color: Colors.white,fontStyle: FontStyle.italic)),
    );
    add(scoreComponent);

    time = TextComponent(
      text: "Time: $remainingTime",
      position: Vector2(size.x/2 + size.x/3.5,40),
      anchor: Anchor.topCenter,
      textRenderer: TextPaint(style: const TextStyle(fontSize: 35, color: Colors.white,fontStyle: FontStyle.italic)),
    );
    add(time);

    await FlameAudio.audioCache.loadAll([
      Globals.giftGrabSound,
      Globals.freezeSound
    ]);

    timer = Timer(1, repeat: true,onTick: () {
      if(remainingTime == 0){
        pauseEngine();
        overlays.add(GameOverScreen.id);
      }else{
        remainingTime -= 1;
      }
    },);

    timer.start();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    timer.update(dt);
    scoreComponent.text = "Score: $score";
    time.text =  "Time: $remainingTime";
  }

  void reset(){
    score =0;
    remainingTime =30;
  }

  @override
  void resumeEngine() {
    // TODO: implement resumeEngine
    super.resumeEngine();
  }

}
