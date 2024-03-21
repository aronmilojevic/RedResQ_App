import 'package:redresq_app/API_Ressources/Moduless/image_modules.dart';
import 'package:redresq_app/API_Ressources/language.dart';

class SubjectMatter {
  int id;
  String title;
  String content; // Change this to a single string
  ImageModelModules image;

  SubjectMatter({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
  });

  factory SubjectMatter.fromJson(Map<String, dynamic> json) {
    List<String> contentList =
        (json['content'] as List<dynamic>).cast<String>();
    String content = contentList.join('\n'); // Concatenate with line breaks
    return SubjectMatter(
      id: json['id'] as int,
      title: json['title'] as String,
      content: content,
      image: ImageModelModules.fromJson(json['image']),
    );
  }
}
