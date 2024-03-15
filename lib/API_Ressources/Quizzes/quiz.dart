import 'package:redresq_app/API_Ressources/Quizzes/quiztype.dart';
import 'package:redresq_app/API_Ressources/Quizzes/question.dart';

class Quiz {
  final int id;
  final String name;
  final int maxScore;
  final List<Question> questions;
  final QuizType type;

  Quiz({
    required this.id,
    required this.name,
    required this.maxScore,
    required this.questions,
    required this.type,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> jsonQuestions =
        List<Map<String, dynamic>>.from(json['questions'] ?? []);
    List<Question> questions =
        jsonQuestions.map((question) => Question.fromJson(question)).toList();

    return Quiz(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      maxScore: json['maxScore'] ?? 0,
      questions: questions,
      type: QuizType.fromJson(json['type'] ?? {}),
    );
  }
}
