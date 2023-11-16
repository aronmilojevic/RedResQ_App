class User {
  final int id;
  final String username;
  // Passwort muss noch in die API implementiert werden
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  final String bday;
  // Es kommen noch weiter Userdaten hinzu!

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.bday,
  });
}


/*
class User {
  final String username;
  final String password;
  // Es kommen noch weiter Userdaten hinzu!

  User({
    required this.username,
    required this.password,
  });
}
*/


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