import 'package:flutter/material.dart';
import 'package:santa_game/Screen/game_play.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
              const Text("Play Game",style: TextStyle(color: Colors.white,fontSize: 30),),
              const SizedBox(height: 25,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GamePlay(),));
              },style: ElevatedButton.styleFrom( fixedSize: const Size(150, 60)), child: const Text("Play", style: TextStyle(color: Colors.white,fontSize: 24)),)
            ],),),
          )
        ],
      ),
    );
  }
}
