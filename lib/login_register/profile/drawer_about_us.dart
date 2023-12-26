import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_headers.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
              Text(
                'About us',
                style: headerTextStyle,
              ),
              SizedBox(height: 20),
              const Image(
                image: AssetImage('lib/assets/profile/OurTeam.png'),
                width: 350,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome to our "About Us" page! We are a close-knit team of three creative minds who got to know each other during our five-year training programme. Our common goal: to realise a project that not only reflects our passion for our respective disciplines, but is also the result of our diploma thesis. ',
                style: subHeaderTextStyle,
              ),
              const SizedBox(height: 10),
              Text(
                    'Over the past five years, we have invested heavily in our education and now we are proud of the completed project that marks the culmination of our academic journey. Each member of our team has contributed their own unique skills and perspectives to ensure a successful realisation. ',
                style: subHeaderTextStyle,
              ),
              const SizedBox(height: 10),
              Text(
                    'Together, we not only acquired theoretical knowledge, but were also able to put it into practice. Our thesis is the result of hard work, teamwork and the belief that by combining our skills we can create something special.',
                style: subHeaderTextStyle,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
