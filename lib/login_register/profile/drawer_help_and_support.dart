import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(height: 10),

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

              const Text(
                'Help & Support',
                style: headerTextStyle,
              ),

              const SizedBox(height: 20),

              const Text(
                'Below you will find telephone numbers that may be able to help you ',
                style: subHeaderTextStyle,
              ),

              SizedBox(height: 20),

              const Image(
                image: AssetImage('lib/assets/profile/feuerwehr.png'),
                width: 350,
                height: 160,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 10),

              const Text(
                'Fire brigade: 122',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: myBlackColor,
                ),
              ),

              SizedBox(height: 20),

              const Image(
                image: AssetImage('lib/assets/profile/polizei.png'),
                width: 350,
                height: 160,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 10),

              const Text(
                'Police: 133',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: myBlackColor,
                ),
              ),

              SizedBox(height: 20),

              const Image(
                image: AssetImage('lib/assets/profile/rettung.png'),
                width: 350,
                height: 160,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 10),

              Text(
                'Ambulance: 144',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: myBlackColor,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
