class Answer {
  final int quizId;
  final int questionId;
  final int id;
  final String text;
  final bool isTrue;

  Answer({
    required this.quizId,
    required this.questionId,
    required this.id,
    required this.text,
    required this.isTrue,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      quizId: json['quizId'] ?? 0,
      questionId: json['questionId'] ?? 0,
      id: json['id'] ?? 0,
      text: json['text'] ?? "",
      isTrue: json['isTrue'] ?? false,
    );
  }
}
