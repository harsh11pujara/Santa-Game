import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:santa_game/Constants/globals.dart';
import 'package:santa_game/Game/santa_game.dart';

class IceComponent extends SpriteComponent with HasGameRef<SantaGame>, CollisionCallbacks {
  double iceSize = 100;
  Random randomPos = Random();
  late Vector2 velocity;
  double iceSpeed = 300;
  double degree = pi / 180;
  late double spawnAngle;
  late Vector2 randomPosition;
  late double dx;
  late double dy;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    randomPosition = generateRandomPosition();

    sprite = await gameRef.loadSprite(Globals.iceSprite);
    add(CircleHitbox(radius: iceSize / 2 - 30, isSolid: true));

    position = randomPosition;
    height = iceSize + 30;
    width = iceSize + 30;
    anchor = Anchor.center;

    spawnAngle = generateRandomAngle();
    dx = cos(spawnAngle * degree) * iceSpeed;
    dy = sin(spawnAngle * degree) * iceSpeed;
    velocity = Vector2(dx, dy);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is ScreenHitbox) {
      Vector2 collisionPoint = intersectionPoints.first;
      // print("collision point $collisionPoint ${gameRef.size.x.toInt()} ${gameRef.size.y.toInt()}");

      if (collisionPoint.x == 0) {
        velocity.x = -velocity.x;
        velocity.y = velocity.y;
      }
      if (collisionPoint.x.toInt() == gameRef.size.x.toInt()) {
        velocity.x = -velocity.x;
        velocity.y = velocity.y;
      }
      if (collisionPoint.y == 0) {
        velocity.x = velocity.x;
        velocity.y = -velocity.y;
      }
      if (collisionPoint.y.toInt() == gameRef.size.y.toInt()) {
        velocity.x = velocity.x;
        velocity.y = -velocity.y;
      }
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    position = position + velocity * dt;
  }

  generateRandomPosition() {
    double x = randomPos.nextInt(gameRef.size.x.toInt() - 20).toDouble();
    double y = randomPos.nextInt(gameRef.size.y.toInt() - 20).toDouble();

    return Vector2(x, y);
  }

  generateRandomAngle() {
    double randomNum = randomPos.nextDouble();
    double angle = lerpDouble(0, 360, randomNum)!;
    return angle;
  }
}
