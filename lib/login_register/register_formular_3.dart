import 'package:flutter/material.dart';
import 'package:redresq_app/application/navbar.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/terms_and_conditions.dart';

class ThirdFormular extends StatefulWidget {
  const ThirdFormular({Key? key}) : super(key: key);

  @override
  _ThirdFormularState createState() => _ThirdFormularState();
}

class _ThirdFormularState extends State<ThirdFormular> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isChecked = false;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String _passwordErrorText = '';

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
              'Create your user',
              style: TextStyle(
                color: Color(0xff464444),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Fill out the text fields below',
              style: TextStyle(
                color: Color(0xff464444),
                fontSize: 15,
              ),
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
                color: Colors.red,
                fontSize: 16,
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
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
                icon,
                color: Color(0xff464444),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  // Hier wird der eingegebene Wert in der entsprechenden Variable gespeichert
                  // Beispiel: Wenn es sich um das Benutzername-Feld handelt, dann _usernameController.text = value;
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
                onChanged: (value) {
                  // Hier wird der eingegebene Wert in der entsprechenden Variable gespeichert
                  // Beispiel: Wenn es sich um das Passwort-Feld handelt, dann _passwordController.text = value;
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
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                onChanged: (value) {
                  // Hier wird der eingegebene Wert in der entsprechenden Variable gespeichert
                  // Beispiel: Wenn es sich um das Bestätigungspasswort-Feld handelt, dann _confirmPasswordController.text = value;
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
                  _isConfirmPasswordVisible =
                  !_isConfirmPasswordVisible;
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
          } else if (_passwordController.text !=
              _confirmPasswordController.text) {
            setState(() {
              _passwordErrorText = 'Passwords do not match';
            });
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavBar()),
            );
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
}