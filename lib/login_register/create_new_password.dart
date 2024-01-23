import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/login_register/start_page_2.0.dart';
import 'package:redresq_app/components/my_snackbars.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class CreateNewPassword extends StatefulWidget {
  final String email;
  final String confirmationCode;
  const CreateNewPassword({Key? key, required this.email, required this.confirmationCode}) : super(key: key);

  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool _isPasswordVisibleOne = false;
  bool _isPasswordVisibleTwo = false;
  TextEditingController _passwordControllerOne = TextEditingController();
  TextEditingController _passwordControllerTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),

              const Image(
                image: AssetImage('lib/assets/reset/new_password.png'),
                width: 650,
                height: 250,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 30),

              const Text(
                'Create new Password',
                style: headerTextStyle,
              ),
              const SizedBox(height: 15),
              const Text(
                'Enter your new password below',
                style: subHeaderTextStyle,
              ),
              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                          controller: _passwordControllerOne,
                          obscureText: !_isPasswordVisibleOne,
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
                          _isPasswordVisibleOne
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xff464444),
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisibleOne = !_isPasswordVisibleOne;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                          controller: _passwordControllerTwo,
                          obscureText: !_isPasswordVisibleTwo,
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
                          _isPasswordVisibleTwo
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xff464444),
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisibleTwo = !_isPasswordVisibleTwo;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Material(
                elevation: 10,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: myRedColor,
                child: MaterialButton(
                  onPressed: () async {
                    bool resetSuccess = await resetPassword(widget.confirmationCode, widget.email, _passwordControllerOne.text);

                    if (resetSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetStartedPage2(),
                        ),
                      );
                    } else {
                      showErrorSnackbar(context, 'Something went wrong');
                      print('Fehler beim Zurücksetzen des Passworts');
                    }
                  },
                  minWidth: 350,
                  height: 60,
                  child: const Text(
                    'Confirm',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
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

Future<bool> resetPassword(String confirmationCode, String email, String password) async {
  final String? guestToken = await fetchAuthToken();

  final response = await http.get(
    Uri.parse('https://api.redresq.at/reset/confirm?confirmationCode=${int.parse(confirmationCode)}&email=$email&password=$password'),
    headers: {
      HttpHeaders.authorizationHeader: "bearer $guestToken",
      HttpHeaders.contentTypeHeader: "application/json",
    },
  );

  if (response.statusCode == 200) {
    print('Passwort erfolgreich zurückgesetzt!');
    return true;
  } else {
    print('Fehler beim Zurücksetzen des Passworts: ${response.statusCode}');
    return false;
  }
}
