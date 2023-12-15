import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flappy_flame/components/background.dart';
import 'package:flappy_flame/components/bird.dart';
import 'package:flappy_flame/components/ground.dart';
import 'package:flappy_flame/components/pipe_group.dart';
import 'package:flappy_flame/game/configuration.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  bool isHit = false;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    print('onLoad chla');
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  TextComponent<TextRenderer> buildScore() {
    return TextComponent(
        text: 'Score: ${bird.score}',
        position: Vector2(size.x / 2, size.y / 2 * 0.1),
        anchor: Anchor.center,
        textRenderer: TextPaint(
            style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          letterSpacing: 1,
              fontWeight: FontWeight.bold
        )));
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';
  }

  @override
  void onTap() {
    // TODO: implement onTap
    super.onTap();
    bird.fly();
  }
}
