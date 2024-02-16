import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.04),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                  color: myBlackColor,
                ),
              ),
              Text(
                'Terms and Conditions',
                style: headerTextStyle.copyWith(fontSize: screenHeight * 0.035),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Read the text below',
                style: subHeaderTextStyle.copyWith(fontSize: screenHeight * 0.02),
              ),


              // Datenschutzbeauftragter Todor muss mir noch den Text übergeben
            ],
          ),
        ),
      )
    );
  }
}