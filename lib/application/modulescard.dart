import 'package:flutter/material.dart';
import 'package:redresq_app/application/module_navbar.dart';
import 'package:redresq_app/components/my_colors.dart';

class ModulesCard extends StatelessWidget {
  final String title;

  const ModulesCard({required this.title, Key? key}) : super(key: key);

  String getImagePath(String title) {
    switch (title.toLowerCase()) {
      case 'tsunami':
        return 'lib/assets/learning_modules/tsunami.PNG';
      case 'biohazard':
        return 'lib/assets/learning_modules/biohazard.PNG';
      case 'tornado':
        return 'lib/assets/learning_modules/tornado.png';
      case 'volcano':
        return 'lib/assets/learning_modules/volcano.png';
      case 'earthquake':
        return 'lib/assets/learning_modules/earthquake.PNG';
      case 'terrorist attack':
        return 'lib/assets/learning_modules/terrorist_attack.png';
      case 'wildfire':
        return 'lib/assets/learning_modules/wildfire.PNG';
      case 'floods':
        return 'lib/assets/learning_modules/floods.png';
      default:
        return 'assets/default_background.jpg';
    }
  }

  Widget _getModule() {
    switch (title.toLowerCase()) {
      case 'tsunami':
        return const ModuleNavbar(
          disasterType: 'tsunami',
        );
      case 'volcano':
        return const ModuleNavbar(
          disasterType: 'volcano',
        );
      case 'wildfire':
        return const ModuleNavbar(
          disasterType: 'wildfire',
        );
      case 'biohazard':
        return const ModuleNavbar(
          disasterType: 'biohazard',
        );
      case 'terrorist_attack':
        return const ModuleNavbar(
          disasterType: 'terrorist_attack',
        );
      case 'earthquake':
        return const ModuleNavbar(
          disasterType: 'earthquake',
        );
      case 'floods':
        return const ModuleNavbar(
          disasterType: 'floods',
        );
      case 'tornado':
        return const ModuleNavbar(
          disasterType: 'tornado',
        );
      default:
        return ModuleNavbar(
          disasterType: 'terrorist_attack',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: MediaQuery.of(context).size.width * 0.8 * 0.1,
      color: Colors.black,
    );
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
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
            child: Stack(alignment: Alignment.center, children: [
              Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.8 * 0.1,
                  foreground: Paint()
                    ..color = Colors.white
                    ..strokeWidth = 8
                    ..style = PaintingStyle.stroke,
                ),
              ),
              Text(
                title,
                style: textStyle,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
