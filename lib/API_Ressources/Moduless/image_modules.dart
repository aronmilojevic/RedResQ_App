class ImageModelModules {
  int id;
  var source;

  ImageModelModules({required this.id, required this.source});

  factory ImageModelModules.fromJson(Map<String, dynamic> json) {
    return ImageModelModules(
      id: json['id'] as int,
      source: json['source'] as String,
    );
  }
}
