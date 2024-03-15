class GivenAnswer {
  final int questionId;
  final int answerId;

  GivenAnswer({
    required this.questionId,
    required this.answerId,
  });

  factory GivenAnswer.fromJson(Map<String, dynamic> json) {
    return GivenAnswer(
      questionId: json['id'] as int,
      answerId: json['name'] as int,
    );
  }
}
