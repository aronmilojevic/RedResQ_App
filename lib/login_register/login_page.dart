import 'package:flutter/material.dart';
import 'package:redresq_app/application/dashboard.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/password_reset_1.dart';
import 'package:redresq_app/login_register/register_formular_1.dart';

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
            const Text(
              'Welcome back!',
              style: TextStyle(
                color: Color(0xff464444),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Nice to see you again',
              style: TextStyle(
                color: Color(0xff464444),
                fontSize: 15,
              ),
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

            // Wenn man sich am Dashboard befindet darf die möglichkeit nicht bestehen zurück zum login zu kommen
            Material(
              elevation: 10,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: myRedColor,
              child: MaterialButton(
                onPressed: () {
                  // Überprüfe Benutzername und Passwort
                  if (_usernameController.text == "admin" &&
                      _passwordController.text == "12345") {
                    // Wenn Benutzername und Passwort stimmen, navigiere zur Dashboard-Seite
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  } else {
                    // Zeige eine Fehlermeldung an
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Falscher Benutzername oder Passwort',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
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

            const SizedBox(height: 10),
            const Spacer(),
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
                        color: Color(0xff464444),
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