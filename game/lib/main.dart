import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'screens/game_screen.dart';
import 'screens/list_screen.dart';

Widget Function(Widget) s = (Widget t) => Scaffold(body: SafeArea(child: t));

main() {
  Flame.audio.disableLog();

  runApp(new MaterialApp(
    home: s(ListScreen()),
    routes: {
      '/game': (BuildContext ctx) => s(GameScreen()),
    },
  ));
}