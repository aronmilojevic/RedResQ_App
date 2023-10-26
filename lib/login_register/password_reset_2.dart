import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/start_page.dart';

class SecondReset extends StatelessWidget {
  const SecondReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Ändere hier auf MainAxisAlignment.start
          children: [

            SizedBox(height: 60),


            const Text(
              // -- Übersetzen
              'You\'ve got mail!',
              style: TextStyle(color: Color(0xff464444),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              // -- Übersetzen
              'Check your mails',
              style: TextStyle(color: Color(0xff464444),
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 70),


            const Image(
              // -- Anderes Bild finden
              image: AssetImage('lib/assets/login/check_your_mails.png'),
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),

            const Spacer(),


            Material(
              elevation: 5,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)), // heraudfinden wie man es abrundet!!!
              color: myRedColor,

              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetStartedPage()),
                    // -- einbauen dass wenn men zurück klickt nicht auf diese Seite wieder zurück kommt
                  );
                },
                minWidth: 350,
                height: 60,
                child: const Text(
                  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  // -- Überetzen
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

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}