class QuizType {
  final int id;
  final String name;

  QuizType({
    required this.id,
    required this.name,
  });

  factory QuizType.fromJson(Map<String, dynamic> json) {
    return QuizType(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
    );
  }
}
