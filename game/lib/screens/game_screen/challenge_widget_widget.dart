import 'package:flutter/material.dart';

import '../../models/challenge_widget.dart';

const WIDGET_BOX_SIZE = 100.0;

class ChallengeWidgetWidget extends StatelessWidget {
  final Image icon;
  final String text;
  final ChallengeWidget Function() creator;
  final void Function(ChallengeWidget) onClick;

  const ChallengeWidgetWidget(
      {Key key,
      @required this.icon,
      @required this.text,
      @required this.creator,
      @required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(creator()),
      child: Container(
        child: Container(
          child: Center(
            child: Stack(children: [
              icon,
              Positioned(
                child: Text(text,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                bottom: 2.0,
                right: 4.0,
              ),
            ]),
          ),
          decoration: BoxDecoration(color: Colors.red),
          width: WIDGET_BOX_SIZE,
          height: WIDGET_BOX_SIZE,
        ),
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0, bottom: 16.0),
      ),
    );
  }
}
