import 'package:flutter/material.dart';

import '../../models/challenge_widget.dart';
import './empty_state.dart';

class PreviewView extends StatelessWidget {
  final ChallengeWidget currentWidget;
  final void Function() doVerify;

  PreviewView(this.currentWidget, this.doVerify);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: currentWidget?.toWidget() ?? EmptyState(),
          color: Colors.blue,      
        ),
        if (doVerify != null) Positioned(
          bottom: 16.0,
          left: 0.0,
          right: 0.0,
          child: Center(
            child: RaisedButton(
              color: Colors.yellow,
              child: Text('Verify', style: TextStyle(color: Colors.black)),
              onPressed: doVerify,
            )
          ),
        )
      ],
    );
  }
}