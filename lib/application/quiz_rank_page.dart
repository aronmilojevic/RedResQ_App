import 'package:flutter/material.dart';
import 'package:redresq_app/application/quiz_test.dart';
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

class ResultPage extends StatelessWidget {
  final int result;
  final String type;

  const ResultPage({Key? key, required this.result, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue, // Set your desired container color
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Quiz Result',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set your desired text color
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your score: $result',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Set your desired text color
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add any action here, e.g., navigation
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizTest(quizType: type),
                    ),
                  );
                  ;
                },
                child: Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
