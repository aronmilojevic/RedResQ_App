import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:redresq_app/application/UIManagement.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_snackbars.dart';
import 'package:redresq_app/login_register/password_reset_1.dart';
import 'package:redresq_app/login_register/register_formular_1.dart';
import 'package:redresq_app/notifications/notification.dart';
import 'package:redresq_app/shared/app_information.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBackButton(context),
            SizedBox(height: screenHeight * 0.01),
            _buildImageSection(screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.03),
            _buildWelcomeText(screenHeight),
            SizedBox(height: screenHeight * 0.01),
            _buildRandomText(screenHeight),
            SizedBox(height: screenHeight * 0.03),
            _buildUsernameField(screenHeight, screenWidth),
            SizedBox(height: screenHeight * 0.01),
            _buildPasswordField(screenHeight, screenWidth),
            SizedBox(height: screenHeight * 0.003),
            _buildForgotPasswordButton(context, screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.003),
            _buildLoginButton(context, screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.002),
            _buildSignupButton(screenHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff464444)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }


  Widget _buildImageSection(double screenWidth, double screenHeight) => Image.asset(
    'lib/assets/login/login_person_3.png',
    width: screenWidth * 0.7,
    height: screenHeight * 0.3,
    fit: BoxFit.contain,
  );

  Widget _buildWelcomeText(double screenHeight) => Text(
    'Welcome back!',
    style: TextStyle(fontSize: screenHeight * 0.03, color: myBlackColor, fontWeight: FontWeight.bold),
  );

  Widget _buildRandomText(double screenHeight) => Text(
    'We have missed you ',
    style: TextStyle(fontSize: screenHeight * 0.02, color: myBlackColor, fontWeight: FontWeight.normal),
  );

  Widget _buildUsernameField(double screenHeight, double screenWidth) => _textFieldContainer(
    screenWidth,
    screenHeight,
    Icon(Icons.person, color: myBlackColor, size: screenHeight * 0.03),
    'Username',
    _usernameController,
    false,
  );

  Widget _buildPasswordField(double screenHeight, double screenWidth) => _textFieldContainer(
    screenWidth,
    screenHeight,
    Icon(Icons.lock, color: Color(0xff464444), size: screenHeight * 0.03),
    'Password',
    _passwordController,
    true,
  );

  Widget _buildForgotPasswordButton(BuildContext context, double screenWidth, double screenHeight) => Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.05),
      child: TextButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordPage())),
        child: Text('Password forgotten?', style: TextStyle(fontSize: screenHeight * 0.02, color: myBlackColor)),
      ),
    ),
  );

  Widget _buildLoginButton(BuildContext context, double screenWidth, double screenHeight) => Material(
    elevation: screenHeight * 0.01,
    borderRadius: BorderRadius.circular(screenHeight * 0.015),
    color: myRedColor,
    child: MaterialButton(
      minWidth: screenWidth * 0.9,
      height: screenHeight * 0.075,
      onPressed: () async {
        bool isAuthenticated = await authenticateUser(
          _usernameController.text,
          _passwordController.text,
          context,
        );
        if (isAuthenticated) {

          requestPermissions();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StartUI()),
          );
        } else {
          showErrorSnackbar(context, 'Username or password is incorrect');
        }
      },
      child: Text('Login', style: TextStyle(fontSize: screenHeight * 0.025, color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );

  Widget _buildSignupButton(double screenHeight) => TextButton(
    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FirstFormular())),
    child: RichText(
      text: TextSpan(
        text: "Don't have an account? ",
        style: TextStyle(fontSize: screenHeight * 0.02, color: myBlackColor),
        children: [TextSpan(text: 'Sign up now!', style: TextStyle(fontSize: screenHeight * 0.02, color: myRedColor, fontWeight: FontWeight.bold))],
      ),
    ),
  );

  Widget _textFieldContainer(double screenWidth, double screenHeight, Widget icon, String hintText, TextEditingController controller, bool isPassword) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Material(
        elevation: screenHeight * 0.01,
        borderRadius: BorderRadius.circular(screenHeight * 0.015),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.all(8.0), child: icon),
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: isPassword && !_isPasswordVisible,
                style: TextStyle(fontSize: screenHeight * 0.025, color: myBlackColor),
                cursorColor: myRedColor,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: screenHeight * 0.02),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: isPassword
                      ? IconButton(
                    icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility, color: Color(0xff464444), size: screenHeight * 0.03),
                    onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                  )
                      : null,
                ),
              ),
            ),
          ],
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
      print('Error fetching authentication token: ${response.statusCode}');
      print('API response: ${response.body}');
      return null;
    }
  } catch (error) {
    print('Network error fetching authentication token: $error');
    return null;
  }
}

Future<bool> authenticateUser(String username, String password, BuildContext context) async {
  try {
    final String? guestToken = await fetchAuthToken();

    final response = await http.get(
      Uri.parse('https://api.redresq.at/auth/login?id=$username&secret=$password'),
      headers: {
        HttpHeaders.authorizationHeader: "bearer $guestToken",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );

    if (response.statusCode == 200) {
      final String userToken = response.body;

      AppInformation.initialize();
      AppInformation.setUserToken(userToken);

      return true;
    } else {
      print('Statuscode: $response.statusCode');
      return false;
    }
  } catch (error) {
    showErrorSnackbar(context, 'Network error: $error');
    print('Network error: $error');
    return false;
  }
}


