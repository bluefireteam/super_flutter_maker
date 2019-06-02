import 'package:flutter/material.dart';

import '../../screens/game_screen/challenge_widget_widget.dart';
import '../challenge_widget.dart';

class PositionedWidget extends ChallengeWidget {

  @override
  String name() => 'Positioned';

  PositionedWidget() {
    properties['child'] = ChallengeWidgetProperty(PropertyType.WIDGET);
    properties['left'] = ChallengeWidgetProperty(PropertyType.DOUBLE);
    properties['right'] = ChallengeWidgetProperty(PropertyType.DOUBLE);
    properties['top'] = ChallengeWidgetProperty(PropertyType.DOUBLE);
    properties['bottom'] = ChallengeWidgetProperty(PropertyType.DOUBLE);
    properties['width'] = ChallengeWidgetProperty(PropertyType.DOUBLE);
    properties['height'] = ChallengeWidgetProperty(PropertyType.DOUBLE);
  }

  Widget toWidget() {
    final child = getProperty('child')?.getAsWidget();
    return child == null ? Container() : Positioned(
      child: child,
      left: properties['left']?.getAsDouble(),
      right: properties['right']?.getAsDouble(),
      top: properties['top']?.getAsDouble(),
      bottom: properties['bottom']?.getAsDouble(),
      width: properties['width']?.getAsDouble(),
      height: properties['height']?.getAsDouble(),
    );
  }

  static ChallengeWidgetWidget toIcon(void Function(ChallengeWidget) onClick) {
    return ChallengeWidgetWidget(
      icon: Image.asset('assets/images/widgets/positioned.png'),
      text: 'Positioned',
      creator: () => PositionedWidget(),
      onClick: onClick,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'class': name(),
      'width': getProperty('width')?.getAsDouble(),
      'height': getProperty('height')?.getAsDouble(),
      'left': getProperty('left')?.getAsDouble(),
      'right': getProperty('right')?.getAsDouble(),
      'top': getProperty('top')?.getAsDouble(),
      'bottom': getProperty('bottom')?.getAsDouble(),
      'child': getProperty('child')?.getAsChallengeWidget()?.toMap(),
    };
  }
}

