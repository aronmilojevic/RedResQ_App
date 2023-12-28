class Country {
  int id;
  String countryName;

  Country({required this.id, required this.countryName});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'] as int,
      countryName: json['countryName'] as String,
    );
  }
}
