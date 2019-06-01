import 'package:flutter/material.dart';

import '../../models/challenge_widget.dart';
import './empty_state.dart';

class PreviewView extends StatelessWidget {
  final ChallengeWidget currentWidget;

  PreviewView(this.currentWidget);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: currentWidget?.toWidget() ?? EmptyState(),
      color: Colors.blue,      
    );
  }
}