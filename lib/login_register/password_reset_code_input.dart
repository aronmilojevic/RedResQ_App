import 'dart:io';
import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/login_register/create_new_password.dart';
import 'package:redresq_app/components/my_snackbars.dart';
import 'package:http/http.dart' as http;

class ResetCodeInput extends StatefulWidget {
  final String email;

  const ResetCodeInput({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  _ResetCodeInputState createState() => _ResetCodeInputState();
}

class _ResetCodeInputState extends State<ResetCodeInput> {
  final List<TextEditingController> textControllers =
  List.generate(6, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  String getVerificationCode() {
    return textControllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(height: screenHeight * 0.04),

                 Image(
                  image: AssetImage('lib/assets/reset/code.png'),
                   width: screenWidth * 0.9,
                   height: screenHeight * 0.3,
                   fit: BoxFit.contain,
                ),

                SizedBox(height: screenHeight * 0.03),

                Text(
                  'Enter the code',
                  style: TextStyle(
                    color: myBlackColor,
                    fontSize: screenHeight * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: screenHeight * 0.01),

                Text(
                  'A 6 digits code has been sent to',
                  style: TextStyle(
                    color: myBlackColor,
                    fontSize: screenHeight * 0.02,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                Text(
                  '${widget.email}',
                  style: TextStyle(
                    color: myBlackColor,
                    fontSize: screenHeight * 0.02,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                SizedBox(height: screenHeight * 0.04),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    6,
                        (index) => SizedBox(
                      width: screenWidth * 0.11,
                      child: Material(
                        elevation: screenHeight * 0.01,
                        borderRadius: BorderRadius.circular(screenHeight * 0.015),
                        color: Color(0xfff3f3f3),
                        child: TextField(
                          controller: textControllers[index],
                          onChanged: (value) {
                            if (value.length > 1) {
                              textControllers[index].text = value.substring(0, 1);
                            }

                            if (value.isNotEmpty && index < 5) {
                              FocusScope.of(context)
                                  .requestFocus(focusNodes[index + 1]);
                            }
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.03,
                            color: myRedColor,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                            ),
                            fillColor: Color(0xfff3f3f3),
                            alignLabelWithHint: true,
                          ),
                          focusNode: focusNodes[index],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                Material(
                  elevation: screenHeight * 0.02,
                  borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.015)),
                  color: myRedColor,
                  child: MaterialButton(
                    onPressed: () async {
                      String verificationCode = getVerificationCode();
                      print("Verification Code: $verificationCode");
                      bool resetSuccess = await isVerificationCode(
                          verificationCode, widget.email);

                      if (resetSuccess) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateNewPassword(email: widget.email, confirmationCode: verificationCode),
                          ),
                        );

                      } else {
                        showErrorSnackbar(context, 'Wrong Code');
                        print('Fehler beim Zurücksetzen des Passworts');
                      }
                    },
                    minWidth: screenWidth * 0.9,
                    height: screenHeight * 0.075,
                    child: Text(
                      'Send',
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
        ),
      ),
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


Future<bool> isVerificationCode(String code, String email) async {
  final String? guestToken = await fetchAuthToken();

  final response = await http.get(
    Uri.parse('https://api.redresq.at/reset/verify?code=${int.parse(code)}&email=$email'),
    headers: {
      HttpHeaders.authorizationHeader: "bearer $guestToken",
      HttpHeaders.contentTypeHeader: "application/json",
    },
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    print('API-Aufruf fehlgeschlagen. Statuscode: ${response.statusCode}');
    return false;
  }
}

