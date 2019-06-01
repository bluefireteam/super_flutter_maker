import 'package:flutter/material.dart';

import '../challenge_widget.dart';

class CenterWidget extends ChallengeWidget {

  CenterWidget() {
    properties['child'] = ChallengeWidgetProperty(PropertyType.WIDGET);
  }

  Widget toWidget() {
    return Center(child: getProperty('child').getAsWidget());
  }
}

