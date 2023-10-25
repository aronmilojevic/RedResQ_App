import 'package:flutter/material.dart';
import 'package:redresq_app/application/dashboard.dart';
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
            const SizedBox(height: 25),
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
                        obscureText: !_isPasswordVisible,
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
            ),
            const SizedBox(height: 5),
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
                        obscureText: !_isConfirmPasswordVisible,
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
            ),
            const SizedBox(height: 5),

            // Statt dem TextButton eine Checkbox erstellen
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
                      onTap: () {

                      },
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
                          MaterialPageRoute(builder: (context) => TermsAndConditions()),);
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

            Material(
              elevation: 10,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: myRedColor,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavBar()),
                  );
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
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}