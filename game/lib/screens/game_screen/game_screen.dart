import 'package:flutter/material.dart';

import '../../models/challenge_widget.dart';
import 'game_view.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key key}) : super(key: key);

  Widget slider(BuildContext context) {
    return Container(
      height: 132,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(width: 8.0),
          ...ChallengeWidget.all(),
          Container(width: 8.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GameView(),
        ),
        slider(context),
      ],
    );
  }
}
