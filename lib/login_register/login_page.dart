import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:redresq_app/application/UIManagement.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/password_reset_1.dart';
import 'package:redresq_app/login_register/register_formular_1.dart';
import 'package:redresq_app/components/my_snackbars.dart';
import 'package:redresq_app/shared/app_information.dart';
import 'package:redresq_app/notifications/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;


  bool _isPasswordVisible = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height: screenHeight * 0.04),

            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
                color: Color(0xff464444),
              ),
            ),

            SizedBox(height: screenHeight * 0.01),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
              child: Image(
                image: AssetImage('lib/assets/login/login_person_3.png'),
                width: screenWidth * 0.9,
                height: screenHeight * 0.3,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            Text(
              'Welcome back!',
              style: TextStyle(
                color: myBlackColor,
                fontSize: screenHeight * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: screenHeight * 0.01),

            Text(
              'Nice to see you',
              style: TextStyle(
                color: myBlackColor,
                fontSize: screenHeight * 0.02,
                fontWeight: FontWeight.normal,
              ),
            ),

            SizedBox(height: screenHeight * 0.04),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Container(
                width: screenWidth * 0.9,
                child: Material(
                  elevation: screenHeight * 0.01,
                  borderRadius: BorderRadius.circular(screenHeight * 0.015),
                  color: myGreyColor,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          color: myBlackColor,
                          size: screenHeight * 0.03,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _usernameController,
                          style: TextStyle(
                            color: myBlackColor,
                            fontSize: screenHeight * 0.025,
                          ),
                          cursorColor: myRedColor,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                            ),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              fontSize: screenHeight * 0.02,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(

              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Container(
                width: screenWidth * 0.9,
                child: Material(
                  elevation: screenHeight * 0.01,
                  borderRadius: BorderRadius.circular(screenHeight * 0.015),
                  color: const Color(0xfff3f3f3),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.lock,
                          color: Color(0xff464444),
                          size: screenHeight * 0.03,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          style: TextStyle(
                            color: myBlackColor,
                            fontSize: screenHeight * 0.025,
                          ),
                          cursorColor: myRedColor,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontSize: screenHeight * 0.02,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xff464444),
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
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
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
                      fontSize: screenHeight * 0.02,
                      color: myBlackColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Material(
              elevation: screenHeight * 0.02,
              borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.015)),
              color: myRedColor,
              child: MaterialButton(
                onPressed: () async {
                  bool isAuthenticated = await authenticateUser(
                    _usernameController.text,
                    _passwordController.text,
                    context,
                  );
                  if (isAuthenticated) {

                    requestPermissions();

                    // Request notification permissions
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => StartUI()),
                    );
                  } else {
                    showErrorSnackbar(context, 'Username or password is incorrect');
                  }
                },
                minWidth: screenWidth * 0.9,
                height: screenHeight * 0.075,
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenHeight * 0.025,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
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
                    fontSize: screenHeight * 0.02,
                    color: myBlackColor,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign up now!',
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
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
    );
  }
}



// fetchGuestToken
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
      print('Error fetching authentication token: ${response.statusCode}');
      print('API response: ${response.body}');
      return null;
    }
  } catch (error) {
    print('Network error fetching authentication token: $error');
    return null;
  }
}

Future<bool> authenticateUser(String username, String password, BuildContext context) async {
  try {
    final String? guestToken = await fetchAuthToken();

    final response = await http.get(
      Uri.parse('https://api.redresq.at/auth/login?id=$username&secret=$password'),
      headers: {
        HttpHeaders.authorizationHeader: "bearer $guestToken",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );

    if (response.statusCode == 200) {
      final String userToken = response.body;

      AppInformation.initialize();
      AppInformation.setUserToken(userToken);

      return true;
    } else {
      print('Statuscode: $response.statusCode');
      return false;
    }
  } catch (error) {
    showErrorSnackbar(context, 'Network error: $error');
    print('Network error: $error');
    return false;
  }
}
