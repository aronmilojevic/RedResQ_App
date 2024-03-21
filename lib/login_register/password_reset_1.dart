import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_snackbars.dart';
import 'package:redresq_app/login_register/password_reset_code_input.dart';
import 'package:http/http.dart' as http;
import 'dart:io';


class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  String userEmail = "";



  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                  color: Color(0xff464444),
                ),
              ),

              SizedBox(height: screenHeight * 0.01),

              Image(
                image: AssetImage('lib/assets/reset/forget_password.png'),
                width: screenWidth * 0.9,
                height: screenHeight * 0.3,
                fit: BoxFit.contain,
              ),

              SizedBox(height: screenHeight * 0.03),

              Text(
                'Reset password',
                style: TextStyle(
                  color: myBlackColor,
                  fontSize: screenHeight * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: screenHeight * 0.01),

              Text(
                'Don’t worry! It happens. Please enter the \n address associated with your account.',
                style: TextStyle(
                  color: myBlackColor,
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.normal,
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Material(
                  elevation: screenHeight * 0.01,
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xfff3f3f3),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(screenHeight * 0.02),
                        child: Icon(
                          Icons.email,
                          color: Color(0xff464444),
                          size: screenHeight * 0.03,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            color: myBlackColor,
                            fontSize: screenHeight * 0.025,
                          ),
                          controller: emailController,
                          onChanged: (value) {
                            setState(() {
                              userEmail = value;
                            });
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                            ),
                            hintText: 'E-Mail',
                            hintStyle: TextStyle(fontSize: screenHeight * 0.02),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              Material(
                elevation: screenHeight * 0.02,
                borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.015)),
                color: myRedColor,
                child: MaterialButton(
                  onPressed: () async {
                    bool resetSuccess = await resetPassword(userEmail);

                    if (resetSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetCodeInput(email: userEmail),
                        ),
                      );
                    } else {
                      showErrorSnackbar(context, 'Wrong Username');
                      print('Fehler beim Zurücksetzen des Passworts');
                    }
                  },
                  minWidth: screenWidth * 0.9,
                  height: screenHeight * 0.075,
                  child: Text(
                    'Reset',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenHeight * 0.025,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
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

Future<bool> resetPassword(String email) async {
  try {
    final String? token = await fetchAuthToken();

    final response = await http.get(
      Uri.parse('https://api.redresq.at/reset/request?email=$email'),
      headers: {
        HttpHeaders.authorizationHeader:
        "bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Fehler beim Zurücksetzen des Passworts. Statuscode: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Fehler beim Zurücksetzen des Passworts: $e');
    return false;
  }
}
