import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/login_register/profile/edit_language.dart';
import 'package:redresq_app/login_register/profile/edit_notification.dart';
import 'package:redresq_app/login_register/profile/edit_profile.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Color(0xff464444),
                ),
              ),
              const Text(
                'Settings',
                style: headerTextStyle,
              ),
              const SizedBox(height: 35),

              ListTile(
                leading: Icon(Icons.person),
                title: Text('Edit Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notification Settings'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotificationSettings())
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text('Language Settings'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LanguageSettings())
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
