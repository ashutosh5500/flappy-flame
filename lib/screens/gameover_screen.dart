import 'package:flappy_flame/game/assets.dart';
import 'package:flappy_flame/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'gameOver';

  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
             'Nikki farzi😜',
              style: TextStyle(color: Colors.orange, fontSize: 32,fontWeight: FontWeight.normal),
            ),
            Text(
              game.score.text,
              style: TextStyle(color: Colors.white, fontSize: 32,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Image.asset(Assets.gameOver),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: onRestart,
              child: Text('Restart'),
            )
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
