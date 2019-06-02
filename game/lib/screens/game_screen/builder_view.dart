import 'package:flutter/material.dart';

import './empty_state.dart';
import '../../models/challenge_widget.dart';
import '../../util.dart';
import 'edit_dialog.dart';

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
    } else if (selectedWidget != null && selectedWidget.hasMultipleChildren) {
      final currentChildren =
          selectedWidget.getProperty('children').getAsChallengeWidgetList() ??
              [];
      selectedWidget.setPropertyValue('children', [...currentChildren, w]);
      widget.updateCallback(widget.currentWidget);
    }
  }

  void doSelect(ChallengeWidget select) {
    setState(() {
      selectedWidget = select;
    });
  }

  void doRemove(ChallengeWidget removed) {
    ChallengeWidget current = widget.currentWidget;
    if (current == removed) {
      current = null;
    } else {
      _clearOf(current, removed);
    }
    doSelect(null);
    widget.updateCallback(current);
  }

  void _clearOf(ChallengeWidget current, ChallengeWidget removed) {
    if (current.hasSingleChild) {
      ChallengeWidget widget = current.childProperty?.getAsChallengeWidget();
      if (widget == removed) {
        current.setPropertyValue('child', null);
      } else if (widget != null) {
        _clearOf(widget, removed);
      }
    } else if (current.hasMultipleChildren) {
      List<ChallengeWidget> children =
          current.childrenProperty?.getAsChallengeWidgetList();

      final newChildren = children.where((w) => w != removed);
      current.setPropertyValue('children', newChildren.toList());
    }
  }

  void doEdit(ChallengeWidget w) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          EditDialog(widget: w, doUpdateParent: () => this.setState(() {})),
    );
  }

  Widget _content() {
    return widget.currentWidget
            ?.toBuilderWidget(selectedWidget, doSelect, doEdit, doRemove) ??
        EmptyState();
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
