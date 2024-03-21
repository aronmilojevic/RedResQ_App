import 'package:flutter/material.dart';
import 'package:redresq_app/application/UImanagement.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/login_page.dart';
import 'package:redresq_app/login_register/register_formular_1.dart';

class GetStartedPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _skipButton(context, screenHeight, screenWidth),
              SizedBox(height: screenHeight * 0.01),
              _imageSection(screenWidth, screenHeight),
              _titleSection(screenHeight),
              _joinNowButton(context, screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.01),
              _loginButton(context, screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _skipButton(BuildContext context, double screenHeight, double screenWidth) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () => _showSkipDialog(context, screenWidth),
        style: TextButton.styleFrom(
          backgroundColor: myRedColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.05),

          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.arrow_back_ios, color: Colors.white, size: screenHeight * 0.02),
            Text(
              ' Skip',
              style: TextStyle(fontSize: screenHeight * 0.02, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void _showSkipDialog(BuildContext context, double screenWidth) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Would you like to continue?", style: TextStyle(color: myBlackColor)),
          content: Text("If you continue, you will not be able to use the free features.", style: TextStyle(color: myBlackColor)),
          actions: <Widget>[
            _dialogButton(context, "Cancel", myRedColor),
            _dialogButton(context, "Continue", myBlackColor, isContinue: true),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
          ),
          backgroundColor: Colors.white,
        );
      },
    );
  }

  Widget _dialogButton(BuildContext context, String text, Color textColor, {bool isContinue = false}) {
    return TextButton(
      onPressed: () {
        if (isContinue) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => StartUI()));
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }


  Widget _imageSection(double screenWidth, double screenHeight) {
    return Image.asset(
      'lib/assets/start/get_started_img.png',
      width: screenWidth * 0.9,
      height: screenHeight * 0.4,
      fit: BoxFit.contain,
    );
  }

  Widget _titleSection(double screenHeight) {
    return Column(
      children: <Widget>[
        SizedBox(height: screenHeight * 0.02),
        Text('Become a ResQer', style: TextStyle(fontSize: screenHeight * 0.04, color: myBlackColor, fontWeight: FontWeight.bold)),
        SizedBox(height: screenHeight * 0.02),
        Text('Protect yourself and others around you!', style: TextStyle(fontSize: screenHeight * 0.025, color: myBlackColor, fontWeight: FontWeight.bold)),
        Text('Our goal is saving lives through our', style: TextStyle(fontSize: screenHeight * 0.025, color: myBlackColor, fontWeight: FontWeight.bold)),
        Text('developed IT system', style: TextStyle(fontSize: screenHeight * 0.025, color: myBlackColor, fontWeight: FontWeight.bold)),
        SizedBox(height: screenHeight * 0.04),
      ],
    );
  }


  Widget _joinNowButton(BuildContext context, double screenWidth, double screenHeight) {
    return Material(
      elevation: screenHeight * 0.02,
      borderRadius: BorderRadius.circular(screenHeight * 0.015),
      color: myRedColor,
      child: MaterialButton(
        minWidth: screenWidth * 0.9,
        height: screenHeight * 0.075,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FirstFormular())),
        child: Text('Join Now', style: TextStyle(fontSize: screenHeight * 0.025, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _loginButton(BuildContext context, double screenWidth, double screenHeight) {
    return Material(
      elevation: screenHeight * 0.02,
      borderRadius: BorderRadius.circular(screenHeight * 0.015),
      color: myGreyColor,
      child: MaterialButton(
        minWidth: screenWidth * 0.9,
        height: screenHeight * 0.075,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
        child: Text('Login', style: TextStyle(fontSize: screenHeight * 0.025, color: myRedColor, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
