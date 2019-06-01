import 'package:flutter/material.dart';

import '../../screens/game_screen/challenge_widget_widget.dart';
import '../challenge_widget.dart';

class RaisedButtonWidget extends ChallengeWidget {

  @override
  String name() => 'RaisedButton';

  RaisedButtonWidget() {
    properties['child'] = ChallengeWidgetProperty(PropertyType.WIDGET);
  }

  Widget toWidget() {
    final child = getProperty('child')?.getAsWidget();
    return RaisedButton(child: child == null ? Container(width: 1, height: 1,) : child, onPressed: () {});
  }

  static ChallengeWidgetWidget toIcon(void Function(ChallengeWidget) onClick) {
    return ChallengeWidgetWidget(
      icon: Image.asset('assets/images/widgets/raised_button.png'),
      text: 'Raised Button',
      creator: () => RaisedButtonWidget(),
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

