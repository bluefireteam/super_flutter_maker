import 'package:flutter/material.dart';

import '../../util.dart';
import 'game_widget_widget.dart';


class GameScreen extends StatelessWidget {
  const GameScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: Colors.cyan),
          ),
        ),
        Container(
          child: pad(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GameWidgetWidget(),
                GameWidgetWidget(),
                GameWidgetWidget(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
