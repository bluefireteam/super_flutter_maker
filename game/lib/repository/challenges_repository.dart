import '../models/challenge.dart';
import '../models/widgets/center.dart';
import '../models/widgets/text.dart';


class ChallengeRepository {
  List<Challenge> _challenges;

  ChallengeRepository() {
    Challenge helloWorldChallenge = Challenge();
    helloWorldChallenge.title = "Welcome to Flutter";
    helloWorldChallenge.difficultyLevel = 1;


    helloWorldChallenge.widgets = [
      CenterWidget()
        ..setPropertyValue("child", TextWidget()..setPropertyValue("text", "Hello World"))
    ];

    List<Challenge> _challenges = [helloWorldChallenge];
  }

  List<Challenge> allChallenges() {
    return _challenges;
  }
}
