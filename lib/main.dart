import 'package:flutter/material.dart';
import 'package:quizz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();

  checkAnswer(bool userAnswer) {
    if (quizBrain.checkQuizEnd() == true) {
      Alert(
          context: context,
          type: AlertType.success,
          title: "QuizApp",
          desc: "El quiz ha terminado",
          buttons: [
            DialogButton(
              child: Text("Aceptar"),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ]).show();
      quizBrain.resetQuiz();
      scoreKeeper.clear();
      setState(() {});
    } else {
      bool correctAnswer = quizBrain.getQuestionAnswer();
      if (correctAnswer == userAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.greenAccent,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.redAccent,
          ),
        );
      }
      quizBrain.nextQuestion();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Text(
          "QuizApp",
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text("Verdadero"),
                color: Colors.green.shade500,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text("falso"),
                color: Colors.red.shade500,
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
