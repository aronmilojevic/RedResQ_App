import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/password_reset_2.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Ändere hier auf MainAxisAlignment.start
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

            const SizedBox(height: 25),

            const Text(
              //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              // -- Überetzen
              'Passwort zurücksetzen',
              style: TextStyle(color: Color(0xff464444),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            const Text(
              //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              // -- Überetzen
              'Sie erhlaten in kürze eine E-Mail',
              style: TextStyle(color: Color(0xff464444),
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 50),

            //
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)), // heraudfinden wie man es abrundet!!!
                color: Color(0xfff3f3f3),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        //borderSide: BorderSide(color: Color(0xfff3f3f3)),
                        borderSide: BorderSide(color: Color(0x00000000)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x00000000)),
                      ),

                      hintText: 'E-Mail'
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Material(
              elevation: 5,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)), // heraudfinden wie man es abrundet!!!
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
                child: const Text(
                  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  // -- Überetzen
                  'Zurücksetzen',
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
