import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_headers.dart';

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
              ],
            ),
          ),
        )
    );
  }
}