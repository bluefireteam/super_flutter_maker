import '../models/challenge.dart';
import '../models/widgets/center.dart';
import '../models/widgets/text.dart';
import '../models/widgets/column.dart';
import '../models/widgets/raised_button.dart';


class ChallengeRepository {
  List<Challenge> _challenges;

  ChallengeRepository() {
    Challenge helloWorldChallenge = Challenge();
    helloWorldChallenge.id = "1";
    helloWorldChallenge.title = "Welcome to Flutter";
    helloWorldChallenge.difficultyLevel = 1;

    helloWorldChallenge.child =
      CenterWidget()
        ..setPropertyValue('child', TextWidget()..setPropertyValue('text', 'Hello World'));

    Challenge helloWorldChallenge2 = Challenge();
    helloWorldChallenge2.id = "2";
    helloWorldChallenge2.title = "Intermediate Challenge";
    helloWorldChallenge2.difficultyLevel = 2;

    helloWorldChallenge2.child =
      CenterWidget()
        ..setPropertyValue(
          'child',
          ColumnWidget()
            ..setPropertyValue(
              'children',
              [
                TextWidget()..setPropertyValue('text', 'First item'),
                TextWidget()..setPropertyValue('text', 'Second item'),
              ]    
            )
        );

    Challenge helloWorldChallenge3 = Challenge();
    helloWorldChallenge3.id = "3";
    helloWorldChallenge3.title = "Expert Challenge";
    helloWorldChallenge3.difficultyLevel = 3;


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
