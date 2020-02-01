import 'package:flutter/material.dart';

import '../../util.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Super Flutter Maker')),
      body: Center(
        child: Container(
          width: 800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: pad(Text('Super Flutter Maker', style: TextStyle(fontSize: 48.0))),
              ),
              pad(
                FlatButton(
                  child: Text('List Challenges', style: TextStyle(fontSize: 18.0)),
                  onPressed: () => Navigator.of(context).pushNamed('/list'),
                ),
              ),
              pad(
                FlatButton(
                  child: Text('Challenge Builder', style: TextStyle(fontSize: 18.0)),
                  onPressed: () => Navigator.of(context).pushNamed('/builder'),
                ),
              ),
              pad(
                FlatButton(
                  child: Text('Challenge Marketplace', style: TextStyle(fontSize: 18.0)),
                  onPressed: () => Navigator.of(context).pushNamed('/marketplace'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}