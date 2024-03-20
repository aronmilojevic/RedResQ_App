import 'package:flutter/material.dart';
import 'package:redresq_app/application/quizcard.dart';
import 'package:redresq_app/components/my_colors.dart';

class QuizRoom extends StatelessWidget {
  const QuizRoom({Key? key});

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;
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
                        horizontal: 15, vertical: 20),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: cardWidth * 0.1,
                            fontStyle: FontStyle.normal,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.00005),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          QuizCard(
                              title: 'Earthquake', myColors: Color(0xFFCF945D)),
                          QuizCard(
                              title: 'Wildfire', myColors: Color(0xFF84306a)),
                          QuizCard(
                              title: 'Tsunami', myColors: Color(0xFF582b39)),
                          QuizCard(
                              title: 'Biohazard', myColors: Color(0xFFa21a47)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          QuizCard(
                              title: 'Floods', myColors: Color(0xFF5db6d6)),
                          QuizCard(
                              title: 'Volcano', myColors: Color(0xFFbf1f5a)),
                          QuizCard(
                              title: 'Tornado', myColors: Color(0xFF795548)),
                          QuizCard(
                              title: 'Terrorist Attack',
                              myColors: Color(0xFF5a4277)),
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
