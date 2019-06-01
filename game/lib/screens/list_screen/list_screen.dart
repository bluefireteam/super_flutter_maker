import 'package:flutter/material.dart';
import 'package:super_flutter_maker/models/challenge.dart';
import 'package:super_flutter_maker/repository/challenges_repository.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: ChallengeRepository().allChallenges().map((challenge) {
          return ChallengeListElement(challenge: challenge);
        }).toList(),
      ),
    );
  }
}

class ChallengeListElement extends StatelessWidget {
  const ChallengeListElement({
    Key key,
    this.challenge,
  }) : super(key: key);

  final Challenge challenge;

  String difficultyImagePath() {
    switch (this.challenge.difficultyLevel) {
      case 1: return 'assets/images/icons/dash-baby.png';
      case 2: return 'assets/images/icons/dash.png';
      case 3: return 'assets/images/icons/dash-expert.png';
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
          decoration: new BoxDecoration(
            border: new Border(
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(challenge.title,
                style: new TextStyle(
                  fontSize: 20.0,
                )),
            Image.asset(difficultyImagePath(), height: 60, width: 60),
            Icon(Icons.arrow_forward_ios)
          ])),
      onTap: () {
        // Navigator.of(context).pushNamed('/game/' + challenge.id);
        Navigator.of(context).pushNamed('/game');
      },
    );
  }
}