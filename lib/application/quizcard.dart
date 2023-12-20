import 'package:flutter/material.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/application/tsunami_module.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final Color myColors;

  const QuizCard({required this.title, required this.myColors, super.key});

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
        aspectRatio: 1.5,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          color: myColors,
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
