import 'package:flutter/material.dart';

import '../../models/challenge_widget.dart';
import '../../util.dart';
import './empty_state.dart';

class BuilderView extends StatefulWidget {
  final ChallengeWidget currentWidget;
  final void Function(ChallengeWidget) updateCallback;

  BuilderView(this.currentWidget, this.updateCallback);

  @override
  _BuilderViewState createState() => _BuilderViewState();
}

class _BuilderViewState extends State<BuilderView> {

  ChallengeWidget selectedWidget;

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

  void addWidget(ChallengeWidget w) {
    if (widget.currentWidget == null) {
      widget.updateCallback(w);
    } else if (selectedWidget != null && selectedWidget.hasSingleChild) {
      selectedWidget.setPropertyValue('child', w);
      widget.updateCallback(widget.currentWidget);
    }
  }

  void doSelect(ChallengeWidget select) {
    setState(() {
      selectedWidget = select;
    });
  }

  void doEdit(ChallengeWidget select) {
    // TODO edit
  }

  void doRemove(ChallengeWidget select) {
    // TODO remove
  }

  Widget _content() {
    return widget.currentWidget?.toBuilderWidget(selectedWidget, doSelect, doEdit, doRemove) ?? EmptyState();
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
