class Attempt {
  final int id;
  final String name;

  Attempt({
    required this.id,
    required this.name,
  });

  factory Attempt.fromJson(Map<String, dynamic> json) {
    return Attempt(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
    );
  }
}
