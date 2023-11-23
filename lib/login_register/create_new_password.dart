import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/start_page.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

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
      body: Center(
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
              style: TextStyle(
                color: Color(0xff464444),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Enter your new password below',
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
                onPressed: () {
                  if (_passwordControllerOne.text == _passwordControllerTwo.text) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GetStartedPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Password do not match',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
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
    );
  }
}