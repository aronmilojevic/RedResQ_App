import 'package:redresq_app/API_Ressources/location.dart';
import 'package:redresq_app/API_Ressources/image.dart';
import 'package:redresq_app/API_Ressources/language.dart';
import 'package:redresq_app/API_Ressources/Moduless/content.dart';

class Pages {
  int id;
  String title;
  SubjectMatter content;

  Pages({
    required this.id,
    required this.title,
    required this.content,
  });

  factory Pages.fromJson(Map<String, dynamic> json) {
    return Pages(
      id: json['id'] as int,
      title: json['title'] as String,
      content: SubjectMatter.fromJson(json['content']),
    );
  }
}
