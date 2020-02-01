import 'package:flutter/material.dart';
import '../../models/challenge.dart';
import '../../repository/challenges_repository.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Challenges')),
      body: Container(
        child: ListView(
          children: ChallengeRepository().allChallenges().map((challenge) {
            return ChallengeListElement(challenge: challenge);
          }).toList(),
        ),
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
      case 1:
        return 'assets/images/icons/dash-baby.png';
      case 2:
        return 'assets/images/icons/dash.png';
      case 3:
        return 'assets/images/icons/dash-expert.png';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(difficultyImagePath(), height: 60, width: 60),
            Expanded(
              child: Text(
                challenge.title,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/game/${challenge.id}');
      },
    );
  }
}
