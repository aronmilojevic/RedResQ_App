import 'package:flutter/material.dart';
import 'package:redresq_app/application/UIManagement.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/login_page.dart';
import 'package:redresq_app/login_register/register_formular_1.dart';

class GetStartedPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StartUI()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: myBlackColor,
                      ),
                      const Text(
                        ' Skip',
                        style: TextStyle(
                          fontSize: 15,
                          color: myBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Image(
                  image: AssetImage('lib/assets/start/get_started_img.png'),
                  width: 450,
                  height: 250,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Let\'s Get Started',
                  style: TextStyle(
                    color: myBlackColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Protect yourself and others around you!',
                  style: TextStyle(
                    color: myBlackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Our goal is saving lives through our',
                  style: TextStyle(
                    color: myBlackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'developed IT system',
                  style: TextStyle(
                    color: myBlackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 60),
                Material(
                  elevation: 10,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: myRedColor,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirstFormular()),
                      );
                    },
                    minWidth: 370,
                    height: 60,
                    child: const Text(
                      'Join Now',
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
                Material(
                  elevation: 10,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: myGreyColor,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    minWidth: 370,
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: myGreyColor, width: 3),
                    ),
                    child: const Text(
                      'Login',
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
        ),
      ),
    );
  }
}
