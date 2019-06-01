import 'package:flutter/material.dart';

const WIDGET_BOX_SIZE = 100.0;

class GameWidgetWidget extends StatelessWidget {
  const GameWidgetWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.red),
      width: WIDGET_BOX_SIZE,
      height: WIDGET_BOX_SIZE,
    );
  }
}