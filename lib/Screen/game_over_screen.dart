import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:santa_game/Game/santa_game.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({Key? key,required this.gameRef}) : super(key: key);
  final SantaGame gameRef;
  static const String id = "gameOverMenu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/images/background-sprite.jpg",
                fit: BoxFit.fill,
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.4),
            child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
              const Text("Your Score",style: TextStyle(color: Colors.white,fontSize: 30),),
              const SizedBox(height: 5,),
              Text(gameRef.score.toString(),style: const TextStyle(color: Colors.white,fontSize: 30),),
              const SizedBox(height: 25,),
              ElevatedButton(onPressed: (){
               gameRef.overlays.remove(GameOverScreen.id);
               gameRef.reset();
               gameRef.resumeEngine();
              },style: ElevatedButton.styleFrom( fixedSize: const Size(150, 60)), child: const Text("Play Again", style: TextStyle(color: Colors.white,fontSize: 24)),)
            ],),),
          )
        ],
      ),
    );
  }
}
