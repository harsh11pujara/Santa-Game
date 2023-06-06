import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:santa_game/Constants/globals.dart';
import 'package:santa_game/main.dart';

class IceComponent extends SpriteComponent with HasGameRef<SantaGame>{
  double iceSize = 100;
  Random randomPos = Random();
  late Vector2 randomPosition;

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    randomPosition = generateRandomPosition();

    sprite = await gameRef.loadSprite(Globals.iceSprite);
    add(RectangleHitbox(
      size: Vector2(iceSize-60,iceSize-60),
      angle: 0.3
    ));

    position = randomPosition;
    height = iceSize;
    width = iceSize;
    anchor =Anchor.center;
  }

  generateRandomPosition(){
    double x = randomPos.nextInt(gameRef.size.x.toInt()-20).toDouble();
    double y = randomPos.nextInt(gameRef.size.y.toInt()-20).toDouble();

    return Vector2(x, y);
  }
}