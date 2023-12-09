import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/login_register/start_page_2.0.dart';


class NoUser extends StatefulWidget {
  const NoUser({Key? key}) : super(key: key);

  @override
  _NoUserState createState() => _NoUserState();
}

class _NoUserState extends State<NoUser> {
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
                const SizedBox(height: 70),
                const Image(
                  image: AssetImage('lib/assets/offline/offline_no_user.png'),
                  width: 350,
                  height: 350,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Only for ResQers!',
                  style: headerTextStyle,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please register to use all features free of charge.',
                  style: subHeaderTextStyle,
                ),
                const SizedBox(height: 20),
                Material(
                  elevation: 10,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: myGreyColor,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetStartedPage2()),
                      );
                    },
                    minWidth: 370,
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: myGreyColor, width: 3),
                    ),
                    child: const Text(
                      'Back to start',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: myRedColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),


              ],
            ),
          ),
        )
    );
  }
}

