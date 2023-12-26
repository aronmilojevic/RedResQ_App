import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/profile/drawer_about_us.dart';
import 'package:redresq_app/login_register/profile/drawer_help_and_support.dart';
import 'package:redresq_app/login_register/profile/drawer_settings.dart';
import 'package:redresq_app/login_register/start_page_2.0.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: myGreyColor,
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.person,
              color: myRedColor,
              size: 65,
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help & Support'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpAndSupport())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About us'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: myRedColor),
            title: Text('Logout', style: TextStyle(color: myRedColor)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetStartedPage2())
              );
            },
          ),
        ],
      ),
    );
  }
}
