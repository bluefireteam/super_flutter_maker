import 'package:flutter/material.dart';

import '../../util.dart';

const WIDGET_BOX_SIZE = 100.0;

class GameWidgetWidget extends StatelessWidget {
  final String text;

  const GameWidgetWidget({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        decoration: BoxDecoration(color: Colors.red),
        width: WIDGET_BOX_SIZE,
        height: WIDGET_BOX_SIZE,
      ),
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0, bottom: 16.0),
    );
  }
}
