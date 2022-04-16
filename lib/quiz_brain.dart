import 'package:quizzler_app/question.dart';

class QuizeBrain {
  int _questionNumb = 0;
  final List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    // ignore: unnecessary_string_escapes
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  void nextQuestion() {
    if (_questionNumb < _questionBank.length - 1) {
      _questionNumb++;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNumb].question;
  }

  bool getAnswer() {
    return _questionBank[_questionNumb].answer;
  }

  bool isFinished() {
    if (_questionNumb >= _questionBank.length - 1) {
      // ignore: avoid_print
      print('The end of the quiz');
      return true;
    } else {
      return false;
    }
  }

  void resetQuiz() {
    _questionNumb = 0;
  }

  int getQuestionsNumb() {
    return _questionBank.length;
  }
}
