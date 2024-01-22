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
                    color: myGreyColor,
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
                            color: Colors.black),
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
                              title: 'Earthquake', myColors: Color(0xCF945D61)),
                          QuizCard(
                              title: 'Wildfire', myColors: Color(0xA9C9DBA6)),
                          QuizCard(
                              title: 'Tsunami', myColors: Color(0xB3D3F8)),
                          QuizCard(
                              title: 'Biohazard', myColors: Color(0xBDBDBD)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          QuizCard(
                              title: 'Floods', myColors: Color(0xFF9C27B0)),
                          QuizCard(
                              title: 'Volcano', myColors: Color(0xFFFFC107)),
                          QuizCard(
                              title: 'Tornado', myColors: Color(0xFF795548)),
                          QuizCard(
                              title: 'Terrorist A', myColors: Color(0xFF607D8B)),
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
