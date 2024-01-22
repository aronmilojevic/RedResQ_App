import 'package:flutter/material.dart';
import 'package:redresq_app/application/module_navbar.dart';
import 'package:redresq_app/components/my_colors.dart';

class ModulesCard extends StatelessWidget {
  final String title;

  const ModulesCard({required this.title, Key? key}) : super(key: key);

  String getImagePath(String title) {
    switch (title.toLowerCase()) {
      case 'tsunami':
        return 'lib/assets/learning_modules/tsunami.jpg'; // Replace with the actual path for tsunami
      case 'biohazard':
        return 'assets/biohazard_background.jpg'; // Replace with the actual path for biohazard
      case 'tornado':
        return 'assets/tornado_background.jpg'; // Replace with the actual path for tornado
      case 'volcano':
        return 'assets/volcano_background.jpg'; // Replace with the actual path for volcano
      case 'earthquake':
        return 'assets/earthquake_background.jpg'; // Replace with the actual path for earthquake
      case 'terrorist attack':
        return 'assets/terrorist_attack_background.jpg'; // Replace with the actual path for terrorist attack
      case 'wildfire':
        return 'assets/wildfire_background.jpg'; // Replace with the actual path for wildfire
      case 'tsunami':
        return 'assets/tsunami_background.jpg'; // Replace with the actual path for tsunami
      case 'floods':
        return 'assets/floods_background.jpg'; // Replace with the actual path for floods
      default:
        return 'assets/default_background.jpg'; // Replace with a default background image
    }
  }

  Widget _getModule() {
    switch (title.toLowerCase()) {
      case 'tsunami':
        return const ModuleNavbar(
          disasterType: 'tsunami',
        );
      // Add more cases as needed for other titles
      default:
        // Return a default module or handle the case accordingly
        return ModuleNavbar(
          disasterType: 'Tsunami',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _getModule(),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 2.75,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(getImagePath(title)),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                fontStyle: FontStyle.italic,
                color: Colors.lime,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
