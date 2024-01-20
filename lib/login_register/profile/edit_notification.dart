import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/shared/app_information.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool _pushNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const SizedBox(height: 10),
              Text(
                'Notification Settings',
                style: headerTextStyle,
              ),
              const SizedBox(height: 20),
              buildSwitchListTile('Push Notifications', _pushNotificationsEnabled),
              //buildSwitchListTile('Silent Mode', AppInformation.getSilentModeEnabled()),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSwitchListTile(String title, bool value) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: (newValue) {
        setState(() {
          switch (title) {
            case 'Push Notifications':
              _pushNotificationsEnabled = newValue;
              if (newValue) {
                //AppInformation.setSilentModeEnabled(false);
              }
              break;
            case 'Silent Mode':
              if (newValue) {
                _pushNotificationsEnabled = false;
              }
              //AppInformation.setSilentModeEnabled(newValue);
              break;
          }
        });
      },
      activeColor: myRedColor,
    );
  }
}
