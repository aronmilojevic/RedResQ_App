class Language {
  final int id;
  final String name;

  Language({required this.id, required this.name});
}

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
  final int id;
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  final String bday;
  final String sex;
  final Language language;
  final Location location;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.bday,
    required this.sex,
    required this.language,
    required this.location,
  });

  int get languageId => language.id;
  String get languageName => language.name;
  int get locationId => location.id;
  String get country => location.country;
  String get city => location.city;
  String get postalCode => location.postalCode;
}


// So sieht die API zuzeit aus:
/*
Person{
id	integer($int32)
username	string
nullable: true
firstName	string
nullable: true
lastName	string
nullable: true
email	string
nullable: true
birthdate	string($date-time)
sex	Sexinteger($int32)
Enum:
[ 0, 1 ]
language	Language{
id	integer($int32)
name	string
nullable: true
}
location	Location{
id	integer($int32)
country	string
nullable: true
city	string
nullable: true
postalCode	string
nullable: true
}
settings	Settings{
}
role	Role{
id	[...]
name	[...]
}
}*/