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
  var backgroundImage = DecorationImage(
      fit: BoxFit.fill,
      image: AssetImage(
        "lib/assets/quiz/test.png",
      ));

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
              'bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9leHBpcmF0aW9uIjoiNjM4NDg3ODQwNzQzNjM0MDE3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InRvZG9yIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoidG9kb3JsYW5rb3ZzenVAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiMiIsImV4cCI6MTcxMzE4NzI3NH0.XUQyx9eRGVN1UPMv72ON_S3e_sAgxzriDeft4uEvUGNsh8FxmuSBMBhzCsOX_r0oev60lj_HiLy-heZCSTi8GQ',
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
                'bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9leHBpcmF0aW9uIjoiNjM4NDg3ODQwNzQzNjM0MDE3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InRvZG9yIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoidG9kb3JsYW5rb3ZzenVAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiMiIsImV4cCI6MTcxMzE4NzI3NH0.XUQyx9eRGVN1UPMv72ON_S3e_sAgxzriDeft4uEvUGNsh8FxmuSBMBhzCsOX_r0oev60lj_HiLy-heZCSTi8GQ',
          },
          body: json);

      if (response.statusCode == 200) {
        int g = int.parse(jsonDecode(response.body).toString());
        final response2 = await http.get(
          Uri.parse(
              'https://api.redresq.at/attempt/result/?quizId=${quiz.id}&attemptId=${g}'),
          headers: {
            HttpHeaders.authorizationHeader:
                'bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9leHBpcmF0aW9uIjoiNjM4NDg3ODQwNzQzNjM0MDE3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InRvZG9yIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoidG9kb3JsYW5rb3ZzenVAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiMiIsImV4cCI6MTcxMzE4NzI3NH0.XUQyx9eRGVN1UPMv72ON_S3e_sAgxzriDeft4uEvUGNsh8FxmuSBMBhzCsOX_r0oev60lj_HiLy-heZCSTi8GQ',
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
                    decoration: BoxDecoration(image: backgroundImage),
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
      if (!isCorrect) {
        backgroundImage = DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("lib/assets/quiz/Quiz_Erdbeben_Verloren.png"));
      }
    });
  }
}
