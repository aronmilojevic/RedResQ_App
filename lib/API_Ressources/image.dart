class ImageModel {
  int id;
  String description;
  var bytes;

  ImageModel({
    required this.id,
    required this.bytes,
    required this.description
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] as int,
      description: json['description'] as String,
      bytes: json['bytes'],
    );
  }
}
