import 'package:flutter/material.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/application/tsunami_module.dart';

class ModulesCard extends StatelessWidget {
  final String title;
  final Color my_colors;

  const ModulesCard({required this.title, required this.my_colors, Key? key})
      : super(key: key);

  Widget _getModule() {
    switch (title.toLowerCase()) {
      case 'tsunami':
        return const TsunamiModule();
      //case 'earthquake':
      // return const EarthquakeModule();
      // Add more cases as needed for other titles
      default:
        // Return a default module or handle the case accordingly
        return Container();
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
          color: my_colors,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                fontStyle: FontStyle.normal,
                color: Color(0xff464444),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
