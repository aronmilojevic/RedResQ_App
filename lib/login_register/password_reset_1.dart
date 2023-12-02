import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/login_register/password_reset_code_input.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
              const Image(
                image: AssetImage('lib/assets/reset/forget_password.png'),
                width: 550,
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 30),
              Text(
                'Reset password',
                style: headerTextStyle,
              ),
              SizedBox(height: 10),
              Text(
                'Don’t worry! It happens. Please enter the \n address associated with your account.',
                style: subHeaderTextStyle,
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
                      MaterialPageRoute(
                        builder: (context) => ResetCodeInput(email: userEmail),
                      ),
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
      )
    );
  }
}
