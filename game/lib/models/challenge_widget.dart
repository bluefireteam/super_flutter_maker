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
      return (value as ChallengeWidget).toWidget();
    }

    return null;
  }
}

abstract class ChallengeWidget {
  String name();
  Widget toWidget();
  Map<String, ChallengeWidgetProperty> properties = {};

  void setPropertyValue(String name, Object value) {
    ChallengeWidgetProperty prop = properties[name];

    prop?.value = value;
  }

  ChallengeWidgetProperty getProperty(String name) {
    return properties[name];
  }

  static List<ChallengeWidgetWidget> all() {
    return [CenterWidget.toIcon(), TextWidget.toIcon()];
  }

  bool get hasSingleChild => properties.values.any((c) => c.type == PropertyType.WIDGET);

  bool get hasMultipleChildren => false;

  Widget _content() {
    if (hasSingleChild) {
      return properties.values.firstWhere((c) => c.type == PropertyType.WIDGET).getAsChallengeWidget().toBuilderWidget();
    } else if (hasMultipleChildren) {
      throw 'not impl';
    } else {
      return Container();
    }
  }

  Widget toBuilderWidget() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(children: [
        Text(name()),
        pad(_content()),
      ]),
    );
  }
}
