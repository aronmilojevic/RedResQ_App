// ist nicht mehr in verwendung









import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/login_register/password_reset_code_input.dart';

class SecondReset extends StatelessWidget {
  const SecondReset({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height: screenHeight * 0.04),

            const Text(
              'You\'ve got mail!',
              style: headerTextStyle,
            ),

            const SizedBox(height: 10),

            const Text(
              'Check your mails',
              style: subHeaderTextStyle,
            ),

            const SizedBox(height: 70),

            const Image(
              image: AssetImage('lib/assets/login/check_your_mails.png'),
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),

            const Spacer(),

            /*
            Material(
              elevation: 5,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
              color: myRedColor,

              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetCodeInput()),
                  );
                },
                minWidth: 350,
                height: 60,
                child: const Text(
                  'Back to the start',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            */

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}