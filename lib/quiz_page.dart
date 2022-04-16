// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:quizzler_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizeBrain quizeBrain = QuizeBrain();

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late bool answerOfQues;
  int correctAns = 0, wrongAns = 0;
  int sizeOfQuest = quizeBrain.getQuestionsNumb();
  List<Icon> scoreOfQuiz = [];

  void funcOfButton(bool pickedAnswer) {
    answerOfQues = quizeBrain.getAnswer();
    setState(
      () {
        if (quizeBrain.isFinished()) {
          if (correctAns > wrongAns) {
            Alert(
                    context: context,
                    title: "Your Score is $correctAns Out oF $sizeOfQuest",
                    desc: "You Succeeded")
                .show();
            quizeBrain.resetQuiz();
            scoreOfQuiz = [];
            wrongAns = 0;
            correctAns = 0;
          } else {
            Alert(
                    context: context,
                    title: "Your Score is $wrongAns Out oF $sizeOfQuest",
                    desc: "You Fail")
                .show();
            quizeBrain.resetQuiz();
            scoreOfQuiz = [];
            wrongAns = 0;
            correctAns = 0;
          }
        } else {
          if (answerOfQues == pickedAnswer) {
            scoreOfQuiz.add(Icon(
              Icons.check,
              color: Colors.green[400],
            ));
            correctAns++;
          } else {
            scoreOfQuiz.add(const Icon(
              Icons.clear,
              color: Colors.red,
            ));
            wrongAns++;
          }

          quizeBrain.nextQuestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      quizeBrain.getQuestion(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              _buildButton(Colors.green[700]!, 'True', () {
                funcOfButton(true);
              }),
              _buildButton(Colors.red[900]!, 'False', () {
                funcOfButton(false);
              }),
              Row(
                children: scoreOfQuiz,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_buildButton(Color color, String text, Function function) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(25),
        ),
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: () {
        function();
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    ),
  );
}
