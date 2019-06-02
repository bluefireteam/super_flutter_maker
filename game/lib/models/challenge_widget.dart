import 'dart:convert';

import 'package:flutter/material.dart';

import '../screens/game_screen/challenge_widget_widget.dart';
import '../util.dart';
import 'property_editors/double_editor.dart';
import 'property_editors/property_editor.dart';
import 'property_editors/string_editor.dart';
import 'widgets/center.dart';
import 'widgets/column.dart';
import 'widgets/expanded.dart';
import 'widgets/positioned.dart';
import 'widgets/raised_button.dart';
import 'widgets/row.dart';
import 'widgets/stack.dart';
import 'widgets/text.dart';

const EDITABLE_PROPS = [ PropertyType.STRING, PropertyType.DOUBLE ];

final Map<PropertyType, PropertyEditor> propertyEditors = {
  PropertyType.STRING: StringEditor(),
  PropertyType.DOUBLE: DoubleEditor(),
};

enum PropertyType {
  STRING,
  DOUBLE,
  WIDGET,
  WIDGET_LIST,
}

class ChallengeWidgetProperty {
  PropertyType type;
  Object value;

  ChallengeWidgetProperty(this.type);

  String getAsString() {
    if (value == null) {
      return null;
    }
    if (type == PropertyType.STRING) {
      return value as String;
    }
    if (type == PropertyType.DOUBLE) {
      return (value as double).toString();
    }
    return null;
  }

  double getAsDouble() {
    if (type == PropertyType.DOUBLE) {
      return value as double;
    }

    return null;
  }

  ChallengeWidget getAsChallengeWidget() {
    if (type == PropertyType.WIDGET) {
      return value as ChallengeWidget;
    }

    return null;
  }

  List<ChallengeWidget> getAsChallengeWidgetList() {
    if (type == PropertyType.WIDGET_LIST) {
      return value as List<ChallengeWidget>;
    }

    return null;
  }

  Widget getAsWidget() {
    if (type == PropertyType.WIDGET) {
      return (value as ChallengeWidget)?.toWidget();
    }

    return null;
  }

  List<Widget> getAsWidgetList() {
    if (type == PropertyType.WIDGET_LIST) {
      return (value as List<ChallengeWidget>)?.map((w) => w.toWidget())?.toList();
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
    return properties.entries.where((entry) => EDITABLE_PROPS.contains(entry.value.type)).toList();
  }

  static List<ChallengeWidgetWidget> all(void Function(ChallengeWidget) onClick) {
    return [
      CenterWidget.toIcon(onClick),
      TextWidget.toIcon(onClick),
      ColumnWidget.toIcon(onClick),
      RowWidget.toIcon(onClick),
      RaisedButtonWidget.toIcon(onClick),
      StackWidget.toIcon(onClick),
      PositionedWidget.toIcon(onClick),
      ExpandedWidget.toIcon(onClick),
    ];
  }

  bool get hasSingleChild => properties.values.any((c) => c.type == PropertyType.WIDGET);
  bool get hasMultipleChildren => properties.values.any((c) => c.type == PropertyType.WIDGET_LIST);

  ChallengeWidgetProperty get childProperty => properties.values.firstWhere((c) => c.type == PropertyType.WIDGET);
  ChallengeWidgetProperty get childrenProperty => properties.values.firstWhere((c) => c.type == PropertyType.WIDGET_LIST);

  Widget _content(
    ChallengeWidget currentSelected,
    void Function(ChallengeWidget) doSelect,
    void Function(ChallengeWidget) doEdit,
    void Function(ChallengeWidget) doRemove,
  ) {
    if (hasSingleChild) {
      return childProperty?.getAsChallengeWidget()?.toBuilderWidget(currentSelected, doSelect, doEdit, doRemove) ?? Container();
    } else if (hasMultipleChildren) {
      return Column(children: childrenProperty
          ?.getAsChallengeWidgetList()
          ?.map((w) => w?.toBuilderWidget(currentSelected, doSelect, doEdit, doRemove) ?? Container())
          ?.toList() ?? []
      );
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
            ...listEditableProperties()
                .map((entry) => Text(
                  '${entry.key} - ${entry.value?.getAsString() ?? '(empty)'}',
                  style: TextStyle(color: color),
                )).cast().toList(),
            pad(_content(currentSelected, doSelect, doEdit, doRemove)),
          ],
        ),
      ),
    );
  }
}
