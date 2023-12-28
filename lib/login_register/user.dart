/*class Language {
  final int id;
  final String name;

  Language({required this.id, required this.name});
}

class Role {
  final int id;
  final String name;

  Role({required this.id, required this.name});
}*/


class Location {
  final int id;
  final String country;
  final String city;
  final String postalCode;

  Location({
    required this.id,
    required this.country,
    required this.city,
    required this.postalCode,
  });
}

class User {
  //final int id;
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime bday;
  //final int sex;
  final int gender;
  final int language;
  final int location;
  final int role;
  //final Language language;
  //final Location location;
  // Leeres Objekt
  //final Map<String, dynamic> setting;
  //final Role role;

  User({
    //required this.id,
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.bday,
    required this.gender,
    required this.language,
    required this.location,
    required this.role,
    //required this.language,
    //required this.location,
    //required this.setting,
    //required this.role,
  });

  /*
  int get languageId => language.id;
  String get languageName => language.name;
  int get locationId => location.id;
  String get country => location.country;
  String get city => location.city;
  String get postalCode => location.postalCode;
  */
}

