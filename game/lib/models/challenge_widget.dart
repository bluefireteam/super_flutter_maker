import 'package:flutter/material.dart';

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

  Widget getAsWidget() {
    if (type == PropertyType.WIDGET) {
      return (value as ChallengeWidget).toWidget();
    }

    return null;
  }
}

abstract class ChallengeWidget {
  Widget toWidget();
  Map<String, ChallengeWidgetProperty> properties = {};


  void setPropertyValue(String name, Object value) {
    ChallengeWidgetProperty prop = properties[name];

    prop?.value = value;
  }

  ChallengeWidgetProperty getProperty(String name) {
    return properties[name];
  }
}
