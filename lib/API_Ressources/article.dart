import 'package:redresq_app/API_Ressources/location.dart';
import 'package:redresq_app/API_Ressources/image.dart';
import 'package:redresq_app/API_Ressources/language.dart';

class Article {
  int id;
  String title;
  String content;
  String author;
  DateTime date;
  Language language;
  ImageModel image;
  Location location;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.date,
    required this.language,
    required this.image,
    required this.location,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      author: json['author'] as String,
      date: DateTime.parse(json['date'] as String),
      language: Language.fromJson(json['language']),
      image: ImageModel.fromJson(json['image']),
      location: Location.fromJson(json['location']),
    );
  }
}
