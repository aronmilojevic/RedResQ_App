import 'package:redresq_app/API_Ressources/language.dart';
import 'package:redresq_app/API_Ressources/Moduless/page.dart';

class Book {
  int id;
  String title;
  Language language;
  List<Pages> page;

  Book({
    required this.id,
    required this.title,
    required this.language,
    required this.page,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      title: json['title'] as String,
      language: Language.fromJson(json['language']),
      page: (json['page'] as List<dynamic>)
          .map((pageJson) => Pages.fromJson(pageJson))
          .toList(),
    );
  }
}
