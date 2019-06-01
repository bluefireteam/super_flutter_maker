import 'package:flutter/material.dart';

import '../../models/challenge_widget.dart';

const List<String> COMPONENTS = [
  'Text',
  'Center',
  'Row',
  'Column',
];

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
          child: Container(
            decoration: BoxDecoration(color: Colors.cyan),
          ),
        ),
        slider(context),
      ],
    );
  }
}
