import 'package:flutter/material.dart';

import '../../screens/game_screen/challenge_widget_widget.dart';
import '../challenge_widget.dart';

class TextWidget extends ChallengeWidget {

  @override
  String name() => 'Text';

  TextWidget() {
    properties['text'] = ChallengeWidgetProperty(PropertyType.STRING);
  }

  Widget toWidget() {
    String str = getProperty('text')?.getAsString() ?? '<no_text>';
    return Text(str);
  }

  static ChallengeWidgetWidget toIcon(void Function(ChallengeWidget) onClick) {
    return ChallengeWidgetWidget(
      icon: Image.asset('assets/images/widgets/text.png'),
      text: 'Text',
      creator: () => TextWidget(),
      onClick: onClick,
    );
  }
}

