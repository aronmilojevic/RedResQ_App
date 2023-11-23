/*class Language {
  final int id;
  final String name;

  Language({required this.id, required this.name});
}

class Role {
  final int id;
  final String name;

  Role({required this.id, required this.name});
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
}*/

/*
"username": "string",
  "firstName": "string",
  "lastName": "string",
  "email": "string",
  "birthdate": "2023-11-23T12:52:07.301Z",
  "hash": "string",
  "gender": 0,
  "language": 0,
  "location": 0,
  "role": 0
*/

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