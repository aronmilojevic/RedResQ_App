import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_headers.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const SizedBox(height: 35),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.transit_enterexit),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: const Color(0xff464444),
                ),
              ),
              const Text(
                'Terms and Conditions',
                style: headerTextStyle,
              ),


              // Datenschutzbeauftragter Todor muss mir noch den Text übergeben
            ],
          ),
        ),
      )
    );
  }
}