import 'package:flutter/material.dart';

import '../util.dart';

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
                Container(
                    decoration: BoxDecoration(color: Colors.pink),
                    width: 100,
                    height: 100),
                Container(
                    decoration: BoxDecoration(color: Colors.red),
                    width: 100,
                    height: 100),
                Container(
                    decoration: BoxDecoration(color: Colors.blue),
                    width: 100,
                    height: 100),
              ],
            ),
          ),
        )
      ],
    );
  }
}
