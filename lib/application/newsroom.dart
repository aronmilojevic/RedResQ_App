import 'package:flutter/material.dart';
import 'package:redresq_app/application/newscard.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/components/my_colors.dart';

class Newsroom extends StatelessWidget {
  const Newsroom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            NewsCard(title: 'Newsroom'),
            NewsCard(title: 'Floods in Venice'),
            NewsCard(title: 'Wildfires in Naples'),
            NewsCard(title: 'Storms in Vienna'),
            NewsCard(title: 'Tsunamis Tokyo'),
            NewsCard(title: 'China-wide Hurricane!'),
          ],
        ),
      ),
    );
  }
}
