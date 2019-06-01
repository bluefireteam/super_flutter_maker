import '../models/challenge.dart';
import '../models/widgets/center.dart';
import '../models/widgets/text.dart';


class ChallengeRepository {
  List<Challenge> _challenges;

  ChallengeRepository() {
    Challenge helloWorldChallenge = Challenge();
    helloWorldChallenge.id = "1";
    helloWorldChallenge.title = "Welcome to Flutter";
    helloWorldChallenge.difficultyLevel = 1;

    Challenge helloWorldChallenge2 = Challenge();
    helloWorldChallenge2.id = "1";
    helloWorldChallenge2.title = "Welcome to Flutter";
    helloWorldChallenge2.difficultyLevel = 2;

    Challenge helloWorldChallenge3 = Challenge();
    helloWorldChallenge3.id = "1";
    helloWorldChallenge3.title = "Welcome to Flutter";
    helloWorldChallenge3.difficultyLevel = 3;

    helloWorldChallenge.child = helloWorldChallenge2.child = helloWorldChallenge3.child =
      CenterWidget()
        ..setPropertyValue('child', TextWidget()..setPropertyValue('text', 'Hello World'));

    _challenges = [helloWorldChallenge, helloWorldChallenge2, helloWorldChallenge3,];
  }

  List<Challenge> allChallenges() {
    return _challenges;
  }

  Challenge getChallenge(String id) {
    return _challenges
        .where((c) => c.id == id)
        .toList()
        .first;
  }
}
