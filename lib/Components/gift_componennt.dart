import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:santa_game/Components/santa_component.dart';
import 'package:santa_game/Constants/globals.dart';
import 'package:santa_game/main.dart';

class GiftComponent extends SpriteComponent with CollisionCallbacks, HasGameRef<SantaGame>{
  double giftSize = 200;
  Random randomPos = Random();
  late Vector2 randomPosition;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite(Globals.giftSprite);

    randomPosition = generateRandomPosition();

    position = randomPosition;
    height = giftSize/2;
    width = giftSize/1.8;
    anchor =Anchor.center;

    add(RectangleHitbox(
      size: Vector2(giftSize/2-50,giftSize/1.8-50),
    ));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if(other is SantaComponent){
        performOnCollision();
    }
  }

  generateRandomPosition(){
    double x = randomPos.nextInt(gameRef.size.x.toInt()-20).toDouble();
    double y = randomPos.nextInt(gameRef.size.y.toInt()-20).toDouble();

    return Vector2(x, y);
  }

  performOnCollision() async{
    print("boom");
    removeFromParent();
    if (!gameRef.contains(GiftComponent())) {
      await FlameAudio.play(Globals.giftGrabSound);
      await gameRef.add(GiftComponent());
    }
  }
}