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
  Widget toWidget();
  Map<String, ChallengeWidgetProperty> properties = {};

  void setPropertyValue(String name, Object value) {
    ChallengeWidgetProperty prop = properties[name];

    prop?.value = value;
  }

  ChallengeWidgetProperty getProperty(String name) {
    return properties[name];
  }

  static List<ChallengeWidgetWidget> all(void Function(ChallengeWidget) onClick) {
    return [CenterWidget.toIcon(onClick), TextWidget.toIcon(onClick)];
  }

  bool get hasSingleChild => properties.values.any((c) => c.type == PropertyType.WIDGET);

  bool get hasMultipleChildren => false;

  Widget _content(ChallengeWidget currentSelected, void Function(ChallengeWidget) doSelect) {
    if (hasSingleChild) {
      final widget = properties.values.firstWhere((c) => c.type == PropertyType.WIDGET);
      return widget?.getAsChallengeWidget()?.toBuilderWidget(currentSelected, doSelect) ?? Container();
    } else if (hasMultipleChildren) {
      throw 'not impl';
    } else {
      return Container();
    }
  }

  Widget toBuilderWidget(ChallengeWidget currentSelected, void Function(ChallengeWidget) doSelect) {
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
            Text(name(), style: TextStyle(color: color)),
            pad(_content(currentSelected, doSelect)),
          ],
        ),
      ),
    );
  }
}
