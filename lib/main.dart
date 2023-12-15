import 'package:flame/game.dart';
import 'package:flappy_flame/game/flappy_bird_game.dart';
import 'package:flappy_flame/screens/gameover_screen.dart';
import 'package:flappy_flame/screens/main_menu.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    SafeArea(
      child: GameWidget(
        game: game,
        initialActiveOverlays: const [MainMenuScreen.id],
        overlayBuilderMap: {
          "mainMenu": (context, _) => MainMenuScreen(game: game),
          "gameOver": (context, _) => GameOverScreen(game: game),
        },
      ),
    ),
  );
}
