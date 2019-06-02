import 'package:flutter/material.dart';

import '../../screens/game_screen/challenge_widget_widget.dart';
import '../challenge_widget.dart';

class ContainerWidget extends ChallengeWidget {

  @override
  String name() => 'Container';

  ContainerWidget() {
    properties['child'] = ChallengeWidgetProperty(PropertyType.WIDGET);
    properties['width'] = ChallengeWidgetProperty(PropertyType.DOUBLE);
    properties['height'] = ChallengeWidgetProperty(PropertyType.DOUBLE);
  }

  Widget toWidget() {
    final child = getProperty('child')?.getAsWidget();
    return child == null ? Container() : Container(child: child);
  }

  static ChallengeWidgetWidget toIcon(void Function(ChallengeWidget) onClick) {
    return ChallengeWidgetWidget(
      icon: Image.asset('assets/images/widgets/container.png'),
      text: 'Container',
      creator: () => ContainerWidget(),
      onClick: onClick,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'class': name(),
      'width': getProperty('width')?.getAsDouble(),
      'height': getProperty('height')?.getAsDouble(),
      'child': getProperty('child')?.getAsChallengeWidget()?.toMap(),
    };
  }
}

