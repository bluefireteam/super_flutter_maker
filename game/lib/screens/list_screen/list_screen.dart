import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('list'),
          RaisedButton(
            child: Text('ir para o jogo'),
            onPressed: () => Navigator.of(context).pushNamed('/game')),
        ],
      ),
    );
  }
}