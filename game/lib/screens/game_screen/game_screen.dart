import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:super_flutter_maker/models/challenge.dart';

import '../../models/challenge_widget.dart';
import '../../repository/challenges_repository.dart';
import 'builder_view.dart';
import 'preview_view.dart';

const SLIDER_COUNT = 3;

const TextStyle buttonsStyle = TextStyle(color: Colors.white, fontSize: 20);

class GameScreen extends StatefulWidget {
  const GameScreen({Key key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SwiperController swiperController = SwiperController();

  Challenge challenge;
  ChallengeWidget currentWidget;

  _GameScreenState() {
    challenge = ChallengeRepository().allChallenges().first;
    currentWidget = challenge.child;
  }

  Widget slider(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0: return PreviewView(challenge.child);
          case 1: return BuilderView(currentWidget);
          case 2: return PreviewView(currentWidget);
          default: return Text('Loading...');
        }
      },
      itemCount: SLIDER_COUNT,
      loop: false,
      pagination: null,
      control: null,
      controller: swiperController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        slider(context),
        Positioned(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  child: Text('Target', style: buttonsStyle),
                  onPressed: () => swiperController.move(0),
                ),
                FlatButton(
                  child: Text('Builder', style: buttonsStyle),
                  onPressed: () => swiperController.move(1),
                ),
                FlatButton(
                  child: Text('Preview', style: buttonsStyle),
                  onPressed: () => swiperController.move(2),
                ),
              ],
            ),
          ),
          top: 16.0,
          left: 0.0,
          right: 0.0,
        ),
      ],
    );
  }
}