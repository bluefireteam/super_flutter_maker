import 'package:flutter/material.dart';

import '../challenge_widget.dart';

class TextWidget extends ChallengeWidget {

  TextWidget() {
    properties["text"] = ChallengeWidgetProperty(PropertyType.STRING);
  }

  Widget toWidget() {
    return Text(getProperty("text").getAsString());
  }
}

