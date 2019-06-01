import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'screens/game_screen/game_screen.dart';
import 'screens/list_screen/list_screen.dart';
import 'package:fluro/fluro.dart';

Widget Function(Widget) s = (Widget t) => Scaffold(body: t);



main() {
  final router = Router();
  final gameHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return s(GameScreen(id: params["id"][0]));
  });
  router.define('/game/:id', handler: gameHandler);

  final listHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return s(ListScreen());
  });
  router.define('/', handler: listHandler);

  Flame.audio.disableLog();

  runApp(new MaterialApp(
    // home: s(ListScreen()),
    initialRoute: '/',
    onGenerateRoute: router.generator
  ));
}