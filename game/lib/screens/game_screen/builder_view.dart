import 'package:flutter/material.dart';

import '../../models/challenge_widget.dart';
import '../../util.dart';

class BuilderView extends StatelessWidget {
  final ChallengeWidget currentWidget;
  final void Function(ChallengeWidget) updateCallback;

  BuilderView(this.currentWidget, this.updateCallback);

  Widget slider(BuildContext context) {
    return Container(
      height: 132,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(width: 8.0),
          ...ChallengeWidget.all(this.addWidget),
          Container(width: 8.0),
        ],
      ),
    );
  }

  void addWidget(ChallengeWidget widget) {
    if (currentWidget == null) {
      updateCallback(widget);
    }
  }

  Widget _emptySate() {
    return Text('Choose a widget to start with...');
  }

  Widget _content() {
    return currentWidget?.toBuilderWidget() ?? _emptySate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.cyan,
            child: pad(_content()),
          ),
        ),
        slider(context),
      ],
    );
  }
}
