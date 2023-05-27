import 'package:quizz_app/question.dart';

class QuizBrain {
  List<Question> _question = [
    Question(
      questionText: "¿El hombre llegó a la luna?",
      questionAnswer: true,
    ),
    Question(
      questionText: "¿La independencia del Perú fue en 1831?",
      questionAnswer: false,
    ),
    Question(
      questionText: "¿2 + 2 = 4?",
      questionAnswer: true,
    ),
    Question(
      questionText: "¿Te gusta la APP?",
      questionAnswer: true,
    ),
  ];

  int _questionNumber = 0;

  String getQuestionText() {
    return _question[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _question[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _question.length - 1) {
      _questionNumber++;
    }
  }

  bool checkQuizEnd() {
    if (_questionNumber == _question.length - 1) {
      return true;
    }
    return false;
  }

  void resetQuiz() {
    _questionNumber = 0;
  }
}
