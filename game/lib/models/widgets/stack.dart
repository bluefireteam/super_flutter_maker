import 'package:flutter/material.dart';

import '../../screens/game_screen/challenge_widget_widget.dart';
import '../challenge_widget.dart';

class StackWidget extends ChallengeWidget {

  @override
  String name() => 'Stack';

  StackWidget() {
    properties['children'] = ChallengeWidgetProperty(PropertyType.WIDGET_LIST);
  }

  Widget toWidget() {
    final children = getProperty('children')?.getAsWidgetList();
    return children == null ? Container() : Stack(children: children);
  }

  static ChallengeWidgetWidget toIcon(void Function(ChallengeWidget) onClick) {
    return ChallengeWidgetWidget(
      icon: Image.asset('assets/images/widgets/stack.png'),
      text: 'Stack',
      creator: () => StackWidget(),
      onClick: onClick,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'class': name(),
      'children': getProperty('children')?.getAsChallengeWidgetList()?.map((w) => w.toMap())?.toList(),
    };
  }
}


