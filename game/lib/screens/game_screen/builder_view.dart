import 'package:flutter/material.dart';

import '../../models/challenge_widget.dart';

class BuilderView extends StatelessWidget {
  final ChallengeWidget currentWidget;

  BuilderView(this.currentWidget);

  Widget slider(BuildContext context) {
    return Container(
      height: 132,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(width: 8.0),
          ...ChallengeWidget.all(),
          Container(width: 8.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.cyan,
            child: currentWidget.toBuilderWidget(),
          ),
        ),
        slider(context),
      ],
    );
  }
}
