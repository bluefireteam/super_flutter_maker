import 'dart:convert';

import 'package:flutter/material.dart';

import '../screens/game_screen/challenge_widget_widget.dart';
import '../util.dart';
import 'widgets/center.dart';
import 'widgets/text.dart';

enum PropertyType {
  STRING,
  WIDGET
}

class ChallengeWidgetProperty {
  PropertyType type;
  Object value;

  ChallengeWidgetProperty(this.type);

  String getAsString() {
    if (type == PropertyType.STRING) {
      return value as String;
    }

    return null;
  }

  ChallengeWidget getAsChallengeWidget() {
    if (type == PropertyType.WIDGET) {
      return value as ChallengeWidget;
    }

    return null;
  }

  Widget getAsWidget() {
    if (type == PropertyType.WIDGET) {
      return (value as ChallengeWidget)?.toWidget();
    }

    return null;
  }
}

abstract class ChallengeWidget {
  String name();
  Map<String, dynamic> toMap();
  Widget toWidget();
  Map<String, ChallengeWidgetProperty> properties = {};

  String toJson() {
    return json.encode(toMap());
  }

  void setPropertyValue(String name, Object value) {
    ChallengeWidgetProperty prop = properties[name];

    prop?.value = value;
  }

  ChallengeWidgetProperty getProperty(String name) {
    return properties[name];
  }

  List<MapEntry<String, ChallengeWidgetProperty>> listEditableProperties() {
    return properties.entries.where((entry) => entry.value.type == PropertyType.STRING).toList();
  }

  static List<ChallengeWidgetWidget> all(void Function(ChallengeWidget) onClick) {
    return [CenterWidget.toIcon(onClick), TextWidget.toIcon(onClick)];
  }

  bool get hasSingleChild => properties.values.any((c) => c.type == PropertyType.WIDGET);

  bool get hasMultipleChildren => false;

  ChallengeWidgetProperty get childProperty => properties.values.firstWhere((c) => c.type == PropertyType.WIDGET);

  Widget _content(
    ChallengeWidget currentSelected,
    void Function(ChallengeWidget) doSelect,
    void Function(ChallengeWidget) doEdit,
    void Function(ChallengeWidget) doRemove,
  ) {
    if (hasSingleChild) {
      return childProperty?.getAsChallengeWidget()?.toBuilderWidget(currentSelected, doSelect, doEdit, doRemove) ?? Container();
    } else if (hasMultipleChildren) {
      throw 'not impl';
    } else {
      return Container();
    }
  }

  Widget toBuilderWidget(
    ChallengeWidget currentSelected,
    void Function(ChallengeWidget) doSelect,
    void Function(ChallengeWidget) doEdit,
    void Function(ChallengeWidget) doRemove,
  ) {
    bool isMe = currentSelected == this;
    Color color = isMe ? Colors.white : Colors.black;
    return GestureDetector(
      onTap: () => doSelect(this),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: color),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                pad(Text(name(), style: TextStyle(color: color))),
                if (isMe) Row(children: [
                  pad(GestureDetector(
                    child: Icon(Icons.edit, color: Colors.white),
                    onTap: () => doEdit(this),
                  ), p: 4.0),
                  pad(GestureDetector(
                    child: Icon(Icons.delete, color: Colors.white),
                    onTap: () => doRemove(this),
                  ), p: 4.0),
                ]),
              ],
            ),
            ...properties
                .entries
                .where((entry) => entry.value.type == PropertyType.STRING)
                .map((entry) {
                  return Text('${entry.key} - ${entry.value?.getAsString() ?? '(empty)'}', style: TextStyle(color: color));
                }).cast().toList(),
            pad(_content(currentSelected, doSelect, doEdit, doRemove)),
          ],
        ),
      ),
    );
  }
}
