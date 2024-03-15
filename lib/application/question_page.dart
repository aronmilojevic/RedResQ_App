import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:redresq_app/API_Ressources/Quizzes/givenanswer.dart';
import 'package:redresq_app/application/answer_card.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/application/dashboard_card.dart';
import 'package:redresq_app/application/dashboard_card_news.dart';
import 'package:redresq_app/API_Ressources/Quizzes/question.dart';
import 'package:redresq_app/API_Ressources/Quizzes/quiz.dart';
import 'package:redresq_app/API_Ressources/Quizzes/question.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

class QuestionPage extends StatefulWidget {
  final String title;
  final Color cardColor;
  final int id;

  const QuestionPage(
      {Key? key,
      required this.title,
      required this.cardColor,
      required this.id})
      : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late Future<List<Quiz>> _quizzesFuture;
  late PageController _pageController;
  int _currentPageIndex = 0;
  late List<GivenAnswer> givenAnswers;

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
              'bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9leHBpcmF0aW9uIjoiNjM4NDYxMDI3MDAwNzkzNTA3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InRvZG9yIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoidG9kb3JsYW5rb3ZzenVAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiMiIsImV4cCI6MTcxMDUwNTkwMH0.trDsfNCN77PbZnrEWKstxMhnUBGbLmIFlZWpds9K4OMfdOJ4W2-aXYmQAjMveWjyJpnvc1D-ZDhe-Kkr6oqYgQ',
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
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _currentPageIndex++;

        if (_currentPageIndex >= quizzes![0].questions.length) {
          Navigator.pop(context);
        } else {
          _pageController.nextPage(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
          _handleGivenAnswer(
              new GivenAnswer(questionId: question.id, answerId: answeredId));
        }
      });
    });
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
                        image: DecorationImage(
                            image: AssetImage(
                                "lib/assets/quiz/Quiz_Erdbeben_Verloren.png"),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
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
                                question.text,
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
                        for (var answer in question.answers)
                          AnswerCard(
                            title: answer.text,
                            onPressed: () {
                              _handleAnswerSelection(question, answer.isTrue,
                                  snapshot.data, answer.id);
                            },
                            isCorrect: answer.isTrue,
                          ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    color: Colors.white,
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
