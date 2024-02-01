//       ________________________________________________________________________________________
//      |   BESCHREIBUNG:                                                                        |
//      |   Name der Page: LoginPage                                                             |
//      |   Beschreibung: Hier wird man nun aufgefordert den username und das Passwort           |
//      |                 einzugeben. Beim Erfolgreichem anmelden gelangt man in die App         |
//      |   Autor: Milojevic Aron                                                                |
//      |________________________________________________________________________________________|

//       ________________________________________________________________________________________
//      |   STATUS:                                                                              |
//      |   Status der Seite: Fertig                                                             |
//      |________________________________________________________________________________________|

//       ________________________________________________________________________________________
//      |   FUNKTIONALITÄTEN:                                                                    |
//      |   Responsive: JA                                                                       |
//      |   API implementierung: Fertig                                                          |
//      |________________________________________________________________________________________|


// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:redresq_app/application/UIManagement.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/login_register/password_reset_1.dart';
import 'package:redresq_app/login_register/register_formular_1.dart';
import 'package:redresq_app/components/my_snackbars.dart';
import 'package:redresq_app/shared/app_information.dart';
import 'dart:io';

// Define a stateful Flutter widget called LoginPage
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

// Define the state for the LoginPage widget
class _LoginPageState extends State<LoginPage> {

  // State variables
  bool _isPasswordVisible = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // Get the screen width for responsive design
    double screenWidth = MediaQuery.of(context).size.width;

    // Build the main widget structure
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              // Back button
              SizedBox(height: screenWidth * 0.05),
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

              // Login person image
              Image(
                image: AssetImage('lib/assets/login/login_person_3.png'),
                width: screenWidth * 0.7,
                fit: BoxFit.cover,
              ),
              SizedBox(height: screenWidth * 0.05),

              // Header and sub-header text
              Text(
                'Welcome back!',
                style: headerTextStyle,
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                'Nice to see you again',
                style: subHeaderTextStyle,
              ),
              SizedBox(height: screenWidth * 0.1),

              // Username input field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xfff3f3f3),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          color: Color(0xff464444),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                            ),
                            hintText: 'Username',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.01),

              // Password input field with visibility toggle
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                            ),
                            hintText: 'Password',
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
              ),
              SizedBox(height: screenWidth * 0.005),

              // Password reset button
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.05),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                      );
                    },
                    child: Text(
                      'Password forgotten?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff464444),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.005),

              // Login button
              Material(
                elevation: 10,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: myRedColor,
                child: MaterialButton(
                  onPressed: () async {
                    bool isAuthenticated = await authenticateUser(
                      _usernameController.text,
                      _passwordController.text,
                      context,
                    );
                    if (isAuthenticated) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => StartUI()),
                      );
                    } else {
                      showErrorSnackbar(context, 'Username or password is incorrect');
                    }
                  },
                  minWidth: screenWidth * 0.9,
                  height: screenWidth * 0.15,
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Sign-up button
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstFormular()),
                  );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff464444),
                      fontWeight: FontWeight.normal,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontSize: 15,
                          color: myRedColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to fetch authentication token from the server
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

// Function to authenticate the user using provided credentials
Future<bool> authenticateUser(String username, String password, BuildContext context) async {
  try {

    // Fetch guest token
    final String? guestToken = await fetchAuthToken();

    // Send authentication request to the server
    final response = await http.get(
      Uri.parse('https://api.redresq.at/auth/login?id=$username&secret=$password'),
      headers: {
        HttpHeaders.authorizationHeader: "bearer $guestToken",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );

    // Check the response status code
    if (response.statusCode == 200) {
      final String userToken = response.body;

      // Initialize and set the user token in the app information
      AppInformation.initialize();
      AppInformation.setUserToken(userToken);

      return true; // Authentication successful
    } else {
      print('Statuscode: $response.statusCode');
      return false; // Authentication failed
    }
  } catch (error) {
    // Show error snackbar for network errors
    showErrorSnackbar(context, 'Network error: $error');
    print('Network error: $error');
    return false; // Authentication failed due to network error
  }
}

