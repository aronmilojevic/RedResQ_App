import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:redresq_app/API_Ressources/Quizzes/givenanswer.dart';
import 'package:redresq_app/application/answer_card.dart';
import 'package:redresq_app/application/quiz_rank_page.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/application/dashboard_card.dart';
import 'package:redresq_app/application/dashboard_card_news.dart';
import 'package:redresq_app/API_Ressources/Quizzes/question.dart';
import 'package:redresq_app/API_Ressources/Quizzes/quiz.dart';
import 'package:redresq_app/API_Ressources/Quizzes/question.dart';
import 'package:redresq_app/shared/app_information.dart';
import 'package:http/http.dart' as http;

class QuestionPage extends StatefulWidget {
  final String title;
  final Color cardColor;
  final int id;
  final String type;

  const QuestionPage(
      {Key? key,
      required this.title,
      required this.cardColor,
      required this.id,
      required this.type})
      : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late Future<List<Quiz>> _quizzesFuture;
  late PageController _pageController;
  int _currentPageIndex = 0;
  late List<GivenAnswer> givenAnswers = [];
  late var attemptId = "";
  late int result = 0;
  var backgroundImage;
  int wrongAnswersCount = 1;

  List<List<String>> imagePaths = [
    [
      "lib/assets/quiz/earthquake_1.png",
      "lib/assets/quiz/earthquake_2.png",
      "lib/assets/quiz/earthquake_3.png",
      "lib/assets/quiz/earthquake_4.png",
    ],
    [
      "lib/assets/quiz/tsunami_1.png",
      "lib/assets/quiz/tsunami_2.png",
      "lib/assets/quiz/tsunami_3.png",
      "lib/assets/quiz/tsunami_4.png",
    ],
    [
      "lib/assets/quiz/floods_1.png",
      "lib/assets/quiz/floods_2.png",
      "lib/assets/quiz/floods_3.png",
      "lib/assets/quiz/floods_4.png",
    ],
    [
      "lib/assets/quiz/wildfire_1.png",
      "lib/assets/quiz/wildfire_2.png",
      "lib/assets/quiz/wildfire_3.png",
      "lib/assets/quiz/wildfire_4.png",
    ],
    [
      "lib/assets/quiz/terrorist_attack_1.png",
      "lib/assets/quiz/terrorist_attack_2.png",
      "lib/assets/quiz/terrorist_attack_3.png",
      "lib/assets/quiz/terrorist_attack_4.png",
    ],
    [
      "lib/assets/quiz/tornado_1.png",
      "lib/assets/quiz/tornado_2.png",
      "lib/assets/quiz/tornado_3.png",
      "lib/assets/quiz/tornado_4.png",
    ],
    [
      "lib/assets/quiz/biohazard_1.png",
      "lib/assets/quiz/biohazard_2.png",
      "lib/assets/quiz/biohazard_3.png",
      "lib/assets/quiz/biohazard_4.png",
    ],
  ];

  DecorationImage _getBackgroundImage() {
    String imagePath;
    switch (widget.type) {
      case "earthquake":
        imagePath = "lib/assets/quiz/earthquake_1.png";
        break;
      case "tsunami":
        imagePath = "lib/assets/quiz/tsunami_1.png";
        break;
      case "floods":
        imagePath = "lib/assets/quiz/floods_1.png";
        break;
      case "wildfire":
        imagePath = "lib/assets/quiz/wildfire_1.png";
        break;
      case "terrorist_attack":
        imagePath = "lib/assets/quiz/terrorist_attack_1.png";
        break;
      case "tornado":
        imagePath = "lib/assets/quiz/tornado_1.png";
        break;
      case "biohazrd":
        imagePath = "lib/assets/quiz/biohazrd_1.png";
        break;
      default:
        imagePath = "lib/assets/quiz/terrorist_attack_1.png";
        break;
    }
    return DecorationImage(
      fit: BoxFit.fill,
      image: AssetImage(imagePath),
    );
  }

  @override
  void initState() {
    super.initState();
    _quizzesFuture = _loadQuizzes();
    _pageController = PageController();
  }

  Future<List<Quiz>> _loadQuizzes() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.redresq.at/quiz/get/?id=${widget.id}'),
        headers: {
          HttpHeaders.authorizationHeader:
              "bearer " + AppInformation.getUserToken().toString(),
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (jsonResponse.containsKey('questions') &&
            jsonResponse['questions'] is List<dynamic>) {
          final List<dynamic> jsonQuestions = jsonResponse['questions'];

          final Quiz quiz = Quiz.fromJson({
            'id': jsonResponse['id'],
            'name': jsonResponse['name'],
            'questions': jsonQuestions,
          });

          return [quiz];
        } else {
          throw Exception('Invalid response format: Missing required fields');
        }
      } else {
        throw Exception(
            'Failed to load quizzes. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  void _handleAnswerSelection(
      Question question, bool isCorrect, List<Quiz>? quizzes, answeredId) {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _currentPageIndex++;

        if (_currentPageIndex == quizzes![0].questions.length) {
          _handleGivenAnswer(
              new GivenAnswer(questionId: question.id, answerId: answeredId));
          _sendgivenAnswersToAPI(givenAnswers, quizzes[0]);
          if (result == 0) {
            Future.delayed(Duration(seconds: 1), () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      ResultPage(
                    result: result,
                    type: "",
                  ),
                ),
              );
            });
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  result: result,
                  type: "",
                ),
              ),
            );
          }
        } else {
          _pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          _handleGivenAnswer(
              new GivenAnswer(questionId: question.id, answerId: answeredId));
        }
      });
    });
  }

  void _sendgivenAnswersToAPI(List<GivenAnswer> givenAnswers, Quiz quiz) async {
    try {
      List<Map<String, dynamic>> jsonList =
          givenAnswers.map((givenAnswer) => givenAnswer.toJson()).toList();
      String json = jsonEncode(jsonList);

      final response = await http.post(
          Uri.parse('https://api.redresq.at/attempt/submit?quizId=${quiz.id}'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader:
                "bearer " + AppInformation.getUserToken().toString(),
          },
          body: json);

      if (response.statusCode == 200) {
        int g = int.parse(jsonDecode(response.body).toString());
        final response2 = await http.get(
          Uri.parse(
              'https://api.redresq.at/attempt/result/?quizId=${quiz.id}&attemptId=${g}'),
          headers: {
            HttpHeaders.authorizationHeader:
                "bearer " + AppInformation.getUserToken().toString(),
          },
        );
        result = int.parse(jsonDecode(response2.body).toString());
      } else {
        throw Exception(
            'Failed to send givenAnswers to API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error sending givenAnswers to API: $e');
    }
  }

  void _handleGivenAnswer(GivenAnswer gg) {
    givenAnswers.add(gg);
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: FutureBuilder<List<Quiz>>(
        future: _quizzesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No quizzes available');
          } else {
            return PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: snapshot.data![0].questions.length + 1,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                if (index < snapshot.data![0].questions.length) {
                  var question = snapshot.data![0].questions[index];
                  return Container(
                    decoration: BoxDecoration(
                      image:
                          index == 0 ? _getBackgroundImage() : backgroundImage,
                    ),
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
                            elevation: cardWidth * 0.025,
                            color: widget.cardColor,
                            child: Container(
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text(
                                widget.type,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: cardWidth * 0.1,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var i = 0;
                                  i < question.answers.length;
                                  i += 2)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (i < question.answers.length)
                                      AnswerCard(
                                        title: question.answers[i].text,
                                        isCorrect: question.answers[i].isTrue,
                                        onPressed: () {
                                          _handleAnswerSelection(
                                            question,
                                            question.answers[i].isTrue,
                                            snapshot.data,
                                            question.answers[i].id,
                                          );
                                        },
                                        onAnswer: _handleAnswer,
                                      ),
                                    if (i + 1 < question.answers.length)
                                      AnswerCard(
                                        title: question.answers[i + 1].text,
                                        isCorrect:
                                            question.answers[i + 1].isTrue,
                                        onPressed: () {
                                          _handleAnswerSelection(
                                            question,
                                            question.answers[i + 1].isTrue,
                                            snapshot.data,
                                            question.answers[i + 1].id,
                                          );
                                        },
                                        onAnswer: _handleAnswer,
                                      ),
                                  ],
                                ),
                            ]),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    child: Center(
                      child: Text(
                        'Your result is: $result',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  void _handleAnswer(bool isCorrect) {
    setState(() {
      if (!isCorrect && wrongAnswersCount < imagePaths[0].length) {
        int disasterIndex = _getDisasterIndex(widget.type);
        if (disasterIndex != -1 &&
            wrongAnswersCount < imagePaths[disasterIndex].length) {
          backgroundImage = DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(imagePaths[disasterIndex][wrongAnswersCount]),
          );
          wrongAnswersCount++;
        }
      } else if (isCorrect && wrongAnswersCount == 1) {
        backgroundImage = _getBackgroundImage();
      }
    });
  }

  int _getDisasterIndex(String type) {
    switch (type) {
      case "earthquake":
        return 0;
      case "tsunami":
        return 1;
      case "floods":
        return 2;
      case "wildfire":
        return 3;
      case "terrorist_attack":
        return 4;
      case "tornado":
        return 5;
      case "biohazard":
        return 6;
      default:
        return 4;
    }
  }
}
