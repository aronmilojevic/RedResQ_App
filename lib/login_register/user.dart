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


  User({
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
  });
}

