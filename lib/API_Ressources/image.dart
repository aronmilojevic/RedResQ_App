class ImageModel {
  int id;
  String source;

  ImageModel({
    required this.id,
    required this.source,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] as int,
      source: json['source'] as String,
    );
  }
}
