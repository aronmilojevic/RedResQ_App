import 'package:flutter/material.dart';
import 'package:redresq_app/application/UIManagement.dart';
import 'package:redresq_app/application/dashboard.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:http/http.dart' as http;
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/login_register/password_reset_1.dart';
import 'package:redresq_app/login_register/register_formular_1.dart';
import 'package:redresq_app/components/my_snackbars.dart';


class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
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
                  image: AssetImage('lib/assets/offline/offline_no_connection.png'),
                  width: 350,
                  height: 350,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Whoops!',
                  style: headerTextStyle,
                ),
                const SizedBox(height: 10),
                const Text(
                  'No Internet connection found. Check your',
                  style: subHeaderTextStyle,
                ),
                const Text(
                  'connection or try again',
                  style: subHeaderTextStyle,
                ),

              ],
            ),
          ),
        )
    );
  }
}

