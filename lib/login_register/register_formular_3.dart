import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:redresq_app/application/UIManagement.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/components/my_snackbars.dart';
import 'package:redresq_app/login_register/terms_and_conditions.dart';
import 'package:redresq_app/login_register/user.dart';

class ThirdFormular extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final DateTime bday;
  final int sex;
  final int country;

  const ThirdFormular({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.bday,
    required this.sex,
    required this.country,

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

  late DateTime birthday;
  String _passwordErrorText = '';

  _ThirdFormularState({
    required String firstName,
    required String lastName,
    required String email,
    required DateTime bday,
  }) {
    _firstNameController.text = firstName;
    _lastNameController.text = lastName;
    _emailController.text = email;

    String formattedDate = DateFormat('dd/MM/yyyy').format(bday);
    _dobController.text = formattedDate;

    birthday = DateFormat('dd/MM/yyyy').parse(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.04),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                  color: myBlackColor,
                ),
              ),
              Text(
                'Create your user',
                style: headerTextStyle.copyWith(fontSize: screenHeight * 0.035),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Fill out the text fields below',
                style: subHeaderTextStyle.copyWith(fontSize: screenHeight * 0.02),
              ),
              SizedBox(height: screenHeight * 0.02),
              Image(
                image: AssetImage('lib/assets/register/progress_formular_3outOf3.png'),
                width: screenWidth * 0.9,
                height: screenHeight * 0.1,
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenHeight * 0.03),
              _buildTextFieldWithIcon(Icons.person, _usernameController, 'Username', screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
              _buildPasswordTextField(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
              _buildConfirmPasswordTextField(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.01),
              Text(
                _passwordErrorText,
                style: TextStyle(
                  color: myRedColor,
                  fontSize: screenHeight * 0.02,
                ),
              ),
              _buildAgreementCheckbox(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.03),
              _buildFinishButton(context, screenWidth, screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon(IconData icon, TextEditingController controller, String hintText, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Material(
        elevation: screenHeight * 0.01,
        borderRadius: BorderRadius.circular(screenHeight * 0.015),
        color: myGreyColor,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: Icon(
                icon,
                color: myBlackColor,
                size: screenHeight * 0.03,
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: screenHeight * 0.02),
                ),
                style: TextStyle(fontSize: screenHeight * 0.02),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordTextField(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Material(
        elevation: screenHeight * 0.01,
        borderRadius: BorderRadius.circular(screenHeight * 0.015),
        color: myGreyColor,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: Icon(
                Icons.lock,
                color: myBlackColor,
                size: screenHeight * 0.03,
              ),
            ),
            Expanded(
              child: TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'New password',
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: screenHeight * 0.02),
                ),
                style: TextStyle(fontSize: screenHeight * 0.02),
              ),
            ),
            IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: myBlackColor,
                size: screenHeight * 0.03,
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

  Widget _buildConfirmPasswordTextField(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Material(
        elevation: screenHeight * 0.01,
        borderRadius: BorderRadius.circular(screenHeight * 0.015),
        color: myGreyColor,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: Icon(
                Icons.lock,
                color: myBlackColor,
                size: screenHeight * 0.03,
              ),
            ),
            Expanded(
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: screenHeight * 0.02),
                ),
                style: TextStyle(fontSize: screenHeight * 0.02),
              ),
            ),
            IconButton(
              icon: Icon(
                _isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: myBlackColor,
                size: screenHeight * 0.03,
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

  Widget _buildAgreementCheckbox(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: (bool? value) {
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
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditions())),
            child: Text(
              'I agree to the terms and conditions',
              style: TextStyle(fontSize: screenHeight * 0.02, color: Color(0xff464444)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinishButton(BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.9,
      child: MaterialButton(
        elevation: screenHeight * 0.02,
        color: myRedColor,
        onPressed: () {
          if (_usernameController.text.isEmpty || _passwordController.text.isEmpty || _confirmPasswordController.text.isEmpty) {

            showErrorSnackbar(context, 'All fields must be filled');

          } else if (!_isChecked) {

            showErrorSnackbar(context, 'You must agree to the terms and conditions');

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
                  username: _usernameController.text,
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  email: _emailController.text,
                  bday: birthday,
                  password: _passwordController.text,
                  gender: widget.sex,
                  language: 1,
                  location: widget.country,
                  role: 1
              );
              createUserInAPI(context, newUser);
            }
          }
        },
        child: Text(
          'Finish',
          style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.025, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenHeight * 0.015)),
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


Future<String?> fetchAuthToken() async {
  final apiUrl = 'https://api.redresq.at/guest/request';


  try {
    final response = await http.get(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      final String authToken = response.body;
      return authToken;
    } else {
      print('Fehler beim Abrufen des Authentifizierungstokens: ${response.statusCode}');
      print('API-Antwort: ${response.body}');
      return null;
    }
  } catch (error) {
    print('Netzwerkfehler beim Abrufen des Authentifizierungstokens: $error');
    return null;
  }
}

Future<void> createUserInAPI(BuildContext context, User user) async {
  try {
    final String? token = await fetchAuthToken();

    if (token != null) {
      final apiUrl = 'https://api.redresq.at/auth/register';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          HttpHeaders.authorizationHeader:
          "bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode({
          //'id': user.id,
          'username': user.username,
          'firstName': user.firstName,
          'lastName': user.lastName,
          'email': user.email,
          'birthdate': user.bday.toIso8601String(),
          'hash': user.password,
          'gender': 1,
          'language': 1,
          'location': 1,
          //'role': 1,


          //'sex': user.sex,
          /*'language': {
          'id': user.languageId,
          'name': user.languageName,
        },
        'location': {
          'id': user.locationId,
          'country': user.country,
          'city': user.city,
          'postalCode': user.postalCode,
        },
        'settings': { },
        'role': {
          'id': user.role.id,
          'name': user.role.name,
        },*/
        }),
      );

      if (response.statusCode == 200) {
        showErrorSnackbar(context, 'Congratulations! You have successfully registered');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StartUI()),
        );
        print('Benutzer erfolgreich erstellt');
      } else {
        showErrorSnackbar(context, 'Fehler bei der Benutzererstellung: ${response.statusCode}');
        print('Fehler bei der Benutzererstellung: ${response.statusCode}');
        print('API-Antwort: ${response.body}');
      }
    } else {
      showErrorSnackbar(context, 'Fehler beim Abrufen des Authentifizierungstokens');
      print('Hier');
    }
  } catch (error) {
    showErrorSnackbar(context, 'Netzwerkfehler: $error');
    print('Netzwerkfehler: $error');
  }
}


