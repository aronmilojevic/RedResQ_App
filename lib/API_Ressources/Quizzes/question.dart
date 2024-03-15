import 'package:redresq_app/API_Ressources/Quizzes/answer.dart';

class Question {
  final int quizId;
  final int id;
  final String text;
  final List<Answer> answers;

  Question({
    required this.quizId,
    required this.id,
    required this.text,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> jsonAnswers =
        List<Map<String, dynamic>>.from(json['answers'] ?? []);

    List<Answer> answers =
        jsonAnswers.map((answer) => Answer.fromJson(answer)).toList();

    return Question(
      quizId: json['quizId'] ?? 0,
      id: json['id'] ?? 0,
      text: json['text'] ?? "",
      answers: answers,
    );
  }
}
