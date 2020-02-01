import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'screens/builder_screen/builder_screen.dart';
import 'screens/game_screen/game_screen.dart';
import 'screens/list_screen/list_screen.dart';
import 'screens/main_screen/main_screen.dart';
import 'screens/marketplace_screen/builder_screen.dart';

Widget Function(Widget) s = (Widget t) => Scaffold(body: t);

main() {
  final router = Router();
  final gameHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return s(GameScreen(id: params['id'][0]));
  });
  router.define('/game/:id', handler: gameHandler);

  final listHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return s(ListScreen());
  });
  router.define('/list', handler: listHandler);

  final marketplaceHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return s(MarketplaceScreen());
  });
  router.define('/marketplace', handler: marketplaceHandler);

  final builderHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return s(BuilderScreen());
  });
  router.define('/builder', handler: builderHandler);

  final mainHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return s(MainScreen());
  });
  router.define('/', handler: mainHandler);

  runApp(new MaterialApp(
    initialRoute: '/',
    onGenerateRoute: router.generator
  ));
}