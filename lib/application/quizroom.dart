import 'package:flutter/material.dart';
import 'package:redresq_app/application/quizcard.dart';
import 'package:redresq_app/components/my_colors.dart';

class QuizRoom extends StatelessWidget {
  const QuizRoom({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                AspectRatio(
                  aspectRatio: 2.75,
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    color: myRedColor,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Quizroom',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27.5,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                // Empty space
                SizedBox(height: constraints.maxHeight * 0.00005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          QuizCard(
                              title: 'Category 1', myColors: Color(0xFF2196F3)),
                          QuizCard(
                              title: 'Category 2', myColors: Color(0xFFFF5722)),
                          QuizCard(
                              title: 'Category 3', myColors: Color(0xFF4CAF50)),
                          QuizCard(
                              title: 'Category 4', myColors: Color(0xFFFFEB3B)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          QuizCard(
                              title: 'Category 5', myColors: Color(0xFF9C27B0)),
                          QuizCard(
                              title: 'Category 6', myColors: Color(0xFFFFC107)),
                          QuizCard(
                              title: 'Category 7', myColors: Color(0xFF795548)),
                          QuizCard(
                              title: 'Category 8', myColors: Color(0xFF607D8B)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
