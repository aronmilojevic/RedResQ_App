import 'package:flutter/material.dart';
import 'package:redresq_app/application/dashboard.dart';
import 'package:redresq_app/application/modulesroom.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/application/newsroom.dart';
import 'package:redresq_app/application/quizroom.dart';

class NavBar extends StatelessWidget {
  final bool isOnline;

  const NavBar({Key? key, required this.isOnline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationExample(isOnline: isOnline);
  }
}

class NavigationExample extends StatefulWidget {
  final bool isOnline;

  const NavigationExample({Key? key, required this.isOnline}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  static int currentPageIndex = 2;

  final PageController _pageController = PageController(initialPage: 2);

  void setCurrentPageIndex(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: [
          if (widget.isOnline) const Newsroom() else BlankPage(),
          if (widget.isOnline) const Newsroom() else BlankPage(),
          if (widget.isOnline) const Dashboard() else BlankPage(),
          if (widget.isOnline) const QuizRoom() else BlankPage(),
          const ModulesRoom(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          /*border: Border.all(
                  width: 2.5, color: const Color.fromRGBO(168, 39, 28, 1))*/
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23.0),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(168, 39, 28, 1),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 1),
                curve: Curves.easeInOut,
              );
            },
            currentIndex: currentPageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                ),
                label: 'Emoji Events',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.description,
                  color: Colors.white,
                ),
                label: 'Description',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_book,
                  color: Colors.white,
                ),
                label: 'Menu Book',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.lightbulb,
                  color: Colors.white,
                ),
                label: 'Light Bulb',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(), // Blank page
    );
  }
}
