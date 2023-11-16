import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:redresq_app/application/navbar.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/terms_and_conditions.dart';
import 'package:redresq_app/login_register/user.dart';

class ThirdFormular extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String bday;

  const ThirdFormular({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.bday,
  }) : super(key: key);

  @override
  _ThirdFormularState createState() => _ThirdFormularState(
    firstName: firstName,
    lastName: lastName,
    email: email,
    bday: bday,
  );
}

class _ThirdFormularState extends State<ThirdFormular> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isChecked = false;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  String _passwordErrorText = '';

  static const double _screenPadding = 30.0;
  static const TextStyle _headerTextStyle = TextStyle(
    color: Color(0xff464444),
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle _subHeaderTextStyle = TextStyle(
    color: Color(0xff464444),
    fontSize: 15,
  );

  _ThirdFormularState({
    required String firstName,
    required String lastName,
    required String email,
    required String bday,
  }) {
    _firstNameController.text = firstName;
    _lastNameController.text = lastName;
    _emailController.text = email;
    _dobController.text = bday;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color(0xff464444),
              ),
            ),
            Text(
              'Create your user',
              style: _headerTextStyle,
            ),
            const SizedBox(height: 15),
            const Text(
              'Fill out the text fields below',
              style: _subHeaderTextStyle,
            ),
            const SizedBox(height: 5),
            const Image(
              image: AssetImage('lib/assets/register/progress_formular_3outOf3.png'),
              width: 350,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            _buildTextFieldWithIcon(Icons.person, _usernameController, 'Username'),
            const SizedBox(height: 25),
            _buildPasswordTextField(),
            const SizedBox(height: 5),
            _buildConfirmPasswordTextField(),
            const SizedBox(height: 5),
            Text(
              _passwordErrorText,
              style: TextStyle(
                color: myRedColor,
                fontSize: 16,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: _screenPadding),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return myRedColor;
                          }
                          return myGreyColor;
                        },
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      side: BorderSide(
                        color: Colors.black12,
                        width: 2.0,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'I agree to the ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff464444),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TermsAndConditions()),
                        );
                      },
                      child: const Text(
                        'terms and conditions',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff464444),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Spacer(),
            _buildFinishButton(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon(IconData icon, TextEditingController controller, String hintText) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _screenPadding),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xfff3f3f3),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Color(0xff464444),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  setState(() {
                    _passwordErrorText = _validateUsername(value);
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                  ),
                  hintText: hintText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _screenPadding),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xfff3f3f3),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.lock,
                color: Color(0xff464444),
              ),
            ),
            Expanded(
              child: TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                onChanged: (value) {
                  setState(() {
                    _passwordErrorText = _validatePassword(value);
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                  ),
                  hintText: 'New password',
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Color(0xff464444),
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _screenPadding),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xfff3f3f3),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.lock,
                color: Color(0xff464444),
              ),
            ),
            Expanded(
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                onChanged: (value) {
                  setState(() {
                    _passwordErrorText = '';
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                  ),
                  hintText: 'Confirm password',
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                _isConfirmPasswordVisible
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Color(0xff464444),
              ),
              onPressed: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinishButton(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      color: myRedColor,
      child: MaterialButton(
        onPressed: () {
          if (_usernameController.text.isEmpty ||
              _passwordController.text.isEmpty ||
              _confirmPasswordController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('All fields must be filled'),
              ),
            );
          } else if (!_isChecked) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('You must agree to the terms and conditions'),
              ),
            );
          } else {
            String usernameError = _validateUsername(_usernameController.text);
            String passwordError = _validatePassword(_passwordController.text);
            if (usernameError.isNotEmpty) {
              setState(() {
                _passwordErrorText = usernameError;
              });
            } else if (passwordError.isNotEmpty) {
              setState(() {
                _passwordErrorText = passwordError;
              });
            } else if (_passwordController.text !=
                _confirmPasswordController.text) {
              setState(() {
                _passwordErrorText = 'Passwords do not match';
              });
            } else {
              User newUser = User(
                id: 0, // ich suche von der api die anzahl der derzeitigen user und erhöhe die zahl um eins
                // es soll eine fortlaufende Zahl sein
                username: _usernameController.text,
                password: _passwordController.text,
                firstName: _firstNameController.text,
                lastName: _lastNameController.text,
                email: _emailController.text,
                bday: _dobController.text,
              );
              createUserInAPI(context, newUser);
            }
          }
        },
        minWidth: 350,
        height: 60,
        child: const Text(
          'Finish',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  String _validateUsername(String username) {
    if (username.length < 6) {
      return 'Username must be at least 6 characters long';
    }
    if (RegExp(r'[!@#$%^&*(),.?":{}|<> ]').hasMatch(username)) {
      return 'Username cannot contain special characters or spaces';
    }
    return '';
  }

  String _validatePassword(String password) {
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<> ]'))) {
      return 'Password cannot contain special characters or spaces';
    }

    return '';
  }
}


// Beim anklicken des Buttons Finish wird die Funktion createUserInAPI aufgerufen
// diese erstellt in der API einen neuen Usereintrag


Future<void> createUserInAPI(BuildContext context, User user) async {
  // Korrekten URL auswählen
  final apiUrl = 'https://api.redresq.at/swagger/index.html';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': user.id,
        'username': user.username,
        'password': user.password,
        'email': user.email,
        'birthdate': user.bday,
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User successfully created'),
        ),
      );
      print('Benutzer erfolgreich erstellt');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error creating user: ${response.statusCode}'),
        ),
      );
      print('Fehler bei der Benutzererstellung: ${response.statusCode}');
    }
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Network error: $error'),
      ),
    );
    print('Netzwerkfehler: $error');
  }
}
