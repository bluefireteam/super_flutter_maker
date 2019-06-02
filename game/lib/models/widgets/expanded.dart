import 'package:flutter/material.dart';

import '../../screens/game_screen/challenge_widget_widget.dart';
import '../challenge_widget.dart';

class ExpandedWidget extends ChallengeWidget {

  @override
  String name() => 'Expanded';

  ExpandedWidget() {
    properties['child'] = ChallengeWidgetProperty(PropertyType.WIDGET);
  }

  Widget toWidget() {
    final child = getProperty('child')?.getAsWidget();
    return child == null ? Container() : Expanded(child: child);
  }

  static ChallengeWidgetWidget toIcon(void Function(ChallengeWidget) onClick) {
    return ChallengeWidgetWidget(
      icon: Image.asset('assets/images/widgets/expanded.png'),
      text: 'Expanded',
      creator: () => ExpandedWidget(),
      onClick: onClick,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'class': name(),
      'child': getProperty('child')?.getAsChallengeWidget()?.toMap(),
    };
  }
}

