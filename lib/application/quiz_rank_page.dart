import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class RankingComingSoonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.emoji_events,
              size: 100,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Text(
              'Your Rank',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1',
              style: TextStyle(
                fontSize: 18,
                color: myBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
