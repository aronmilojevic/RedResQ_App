import 'package:redresq_app/API_Ressources/country.dart';

class Location {
  int id;
  String city;
  String postalCode;
  Country country;

  Location({
    required this.id,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] as int,
      city: json['city'] as String,
      postalCode: json['postalCode'] as String,
      country: Country.fromJson(json['country']),
    );
  }
}
