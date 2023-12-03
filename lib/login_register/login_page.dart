import 'package:flutter/material.dart';
import 'package:redresq_app/application/UIManagement.dart';
import 'package:redresq_app/application/dashboard.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:http/http.dart' as http;
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/login_register/password_reset_1.dart';
import 'package:redresq_app/login_register/register_formular_1.dart';
import 'package:redresq_app/components/my_snackbars.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
              const Image(
                image: AssetImage('lib/assets/login/login_person_3.png'),
                width: 350,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),

              const Text(
                'Welcome back!',
                style: headerTextStyle,
              ),
              const SizedBox(height: 10),
              const Text(
                'Nice to see you again',
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
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                      );
                    },
                    child: const Text(
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
              const SizedBox(height: 5),

              Material(
                elevation: 10,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: myRedColor,
                child: MaterialButton(
                  onPressed: () async {
                    bool isAuthenticated = await authenticateUser(
                      _usernameController.text,
                      _passwordController.text,
                    );
                    if (isAuthenticated) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StartUI()),
                      );
                    } else {
                      showErrorSnackbar(context, 'username or password is incorrect');
                    }
                  },
                  minWidth: 350,
                  height: 60,
                  child: const Text(
                    'Log in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
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
      )
    );
  }
}

Future<bool> authenticateUser(String username, String password) async {
  final response = await http.get(
    // https://api.redresq.at/session/login?id=11&secret=11
    Uri.parse('https://api.redresq.at/session/login?id=$username&secret=$password'),
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}