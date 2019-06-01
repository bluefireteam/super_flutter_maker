import 'package:flutter/material.dart';

import '../../models/challenge_widget.dart';

class PreviewView extends StatelessWidget {
  final ChallengeWidget currentWidget;

  PreviewView(this.currentWidget);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: currentWidget.toWidget(),
      color: Colors.blue,      
    );
  }
}