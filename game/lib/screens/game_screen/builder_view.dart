import 'package:flutter/material.dart';

import '../../models/challenge_widget.dart';
import '../../util.dart';
import './empty_state.dart';

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

  Widget _content() {
    return currentWidget?.toBuilderWidget() ?? EmptyState();
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
