//       ________________________________________________________________________________________
//      |   BESCHREIBUNG:                                                                        |
//      |   Name der Page: GetStartedPage2                                                       |
//      |   Beschreibung: Hier landet der User sobald er die App startet. Er wird aufgefordert   |
//      |                 auszusuchen ob er ein User anlegen oder ob er sich anmelen möchte      |
//      |   Autor: Milojevic Aron                                                                |
//      |________________________________________________________________________________________|

//       ________________________________________________________________________________________
//      |   STATUS:                                                                              |
//      |   Status der Seite: In bearbeitung                                                     |
//      |________________________________________________________________________________________|

//       ________________________________________________________________________________________
//      |   FUNKTIONALITÄTEN:                                                                    |
//      |   Responsive: Nein (Annähernd fertig)                                                  |
//      |   API implementierung: Fertig                                                          |
//      |________________________________________________________________________________________|

// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:redresq_app/application/UIManagement.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/login_page.dart';
import 'package:redresq_app/login_register/register_formular_1.dart';

// Define a Flutter widget called GetStartedPage2
class GetStartedPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Get the screen width for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    // Build the main widget structure
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Padding(
            // Apply padding to the entire content
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(height: screenHeight * 0.02),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        // Display a confirmation dialog with Skip option
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Would you like to continue?",
                                  style: TextStyle(
                                    color: myBlackColor,
                                  ),
                                ),
                                content: Text(
                                  "If you continue, you will not be able to use the free features.",
                                  style: TextStyle(
                                    color: myBlackColor,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: myRedColor,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => StartUI()),
                                      );
                                    },
                                    child: Text(
                                      "Continue",
                                      style: TextStyle(
                                        color: myBlackColor,
                                      ),
                                    ),
                                  ),
                                ],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                                ),
                                backgroundColor: Colors.white,
                              );
                            },
                          );
                        },

                        // Skip button styling
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: screenHeight * 0.07),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: screenHeight * 0.02,
                              ),
                              Text(
                                ' Skip',
                                style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: myRedColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.05),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    // Display an image
                    Image(
                      image: AssetImage('lib/assets/start/get_started_img.png'),
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.4,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Display title and description
                    Text(
                      'Become a ResQer',
                      style: TextStyle(
                        color: myBlackColor,
                        fontSize: screenHeight * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    Text(
                      'Protect yourself and others around you!',
                      style: TextStyle(
                        color: myBlackColor,
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Our goal is saving lives through our',
                      style: TextStyle(
                        color: myBlackColor,
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'developed IT system',
                      style: TextStyle(
                        color: myBlackColor,
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    Material(
                      elevation: screenHeight * 0.02,
                      borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.015)),
                      color: myRedColor,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstFormular(),
                            ),
                          );
                        },
                        minWidth: screenWidth * 0.9,
                        height: screenHeight * 0.075,
                        child: Text(
                          'Join Now',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenHeight * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    Material(
                      elevation: screenHeight * 0.02,
                      borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.015)),
                      color: myGreyColor,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        minWidth: screenWidth * 0.9,
                        height: screenHeight * 0.075,
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenHeight * 0.025,
                            color: myRedColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
