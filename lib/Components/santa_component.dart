import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:santa_game/Components/gift_componennt.dart';
import 'package:santa_game/Components/ice_component.dart';
import 'package:santa_game/Constants/globals.dart';
import 'package:santa_game/Game/santa_game.dart';

enum MovementState{
  idle,
  slideLeft,
  slideRight,
  santaFrozen
}

class SantaComponent extends SpriteGroupComponent<MovementState> with HasGameRef<SantaGame>, CollisionCallbacks{
  double santaHeight = 150;
  double speed = 500;
  late Vector2 boxPosition;
  bool isFreeze = false;
  Timer timer = Timer(3);

  late double leftBound;
  late double rightBound;
  late double upperBound;
  late double lowerBound;

  JoystickComponent joystick;
  SantaComponent({required this.joystick});

  @override
  Future<void> onLoad() async{
    await super.onLoad();

    Sprite santaIdle = await gameRef.loadSprite(Globals.santa);
    Sprite santaMoveLeft = await gameRef.loadSprite(Globals.santaLeft);
    Sprite santaMoveRight = await gameRef.loadSprite(Globals.santaRight);
    Sprite santaFrozen = await gameRef.loadSprite(Globals.santaFrozen);


    sprites = {
      MovementState.idle : santaIdle,
      MovementState.slideLeft : santaMoveLeft,
      MovementState.slideRight : santaMoveRight,
      MovementState.santaFrozen : santaFrozen
    };

    leftBound = 15;
    rightBound = gameRef.size.x - 15;
    upperBound = 25;
    lowerBound = gameRef.size.y - 40;

    current  = MovementState.idle;

    position = gameRef.size/2;
    height = santaHeight;
    width = santaHeight * 1.42;
    anchor =Anchor.center;

    boxPosition = gameRef.size/2;

    add(RectangleHitbox(
      // position: Vector2(boxPosition.x+20,boxPosition.y+10),
      // anchor: Anchor.center,
      // isSolid: true,
      size: Vector2(santaHeight-50,santaHeight*1.42-50)

    ));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    // print("santa aaa");
    if(other is GiftComponent){
      // print("got gift");
    }
    else if (other is IceComponent){
      if(isFreeze == false) {
        isFreeze = true;
        current = MovementState.santaFrozen;
        FlameAudio.play(Globals.freezeSound);
      }
    }
    else{
      // print("no gift");
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (isFreeze == false) {
      if(x > rightBound){
        x  = rightBound - 1;
      }
      if(x<leftBound){
        x = leftBound + 1;
      }
      if( y > lowerBound){
        y = lowerBound -1;
      }
      if(y < upperBound){
        y = upperBound + 1;
      }

      if(joystick.direction == JoystickDirection.idle){
        current = MovementState.idle;
      }
      else if (joystick.relativeDelta[0] < 0){
        current = MovementState.slideLeft;
      }else{
        current = MovementState.slideRight;
      }

      position.add(joystick.relativeDelta * speed * dt);
      // boxPosition = joystick.relativeDelta * speed * dt;
      boxPosition.add(joystick.relativeDelta * speed * dt);
    }else{
      timer.update(dt);
      if(timer.finished){
        isFreeze = false;
        timer = Timer(3);
      }
    }

  }
}