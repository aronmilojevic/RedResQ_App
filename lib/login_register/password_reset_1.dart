import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/password_reset_2.dart';

class ResetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  late String userEmail;

  ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 35),

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

            SizedBox(height: 25),

            Text(
              'Reset password',
              style: TextStyle(
                color: Color(0xff464444),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              'You will receive an email shortly',
              style: TextStyle(
                color: Color(0xff464444),
                fontSize: 15,
              ),
            ),

            SizedBox(height: 50),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                color: Color(0xfff3f3f3),
                child: TextField(
                  controller: emailController,
                  onChanged: (value) {
                    userEmail = value; // Speichern der E-Mail-Adresse
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x00000000)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x00000000)),
                    ),
                    hintText: 'E-Mail',
                    prefixIcon: Icon(Icons.email, color: Color(0xff464444)),
                    fillColor: Color(0xfff3f3f3),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Material(
              elevation: 5,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: myRedColor,
              child: MaterialButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondReset()),
                  );
                },
                minWidth: 350,
                height: 60,
                child: Text(
                  'Reset',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
