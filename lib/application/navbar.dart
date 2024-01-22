import 'package:flutter/material.dart';
import 'package:redresq_app/application/dashboard.dart';
import 'package:redresq_app/application/modulesroom.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/application/newsroom.dart';
import 'package:redresq_app/application/quizroom.dart';
import 'package:redresq_app/components/offline_no_connection.dart';
import 'package:redresq_app/components/offline_no_user.dart';

class NavBar extends StatelessWidget {
  final bool isOnline;
  final bool isRestricted;

  const NavBar({Key? key, required this.isOnline, required this.isRestricted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationExample(
      isOnline: isOnline,
      isRestricted: isRestricted,
    );
  }
}

class NavigationExample extends StatefulWidget {
  final bool isOnline;
  final bool isRestricted;

  const NavigationExample(
      {Key? key, required this.isOnline, required this.isRestricted})
      : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  late int currentPageIndex = 2;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    currentPageIndex = (widget.isOnline && !widget.isRestricted) ? 2 : 4;
    _pageController = PageController(initialPage: currentPageIndex);
  }

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
          if (widget.isOnline && !widget.isRestricted)
            const Newsroom()
          else if (!widget.isOnline && !widget.isRestricted)
            NoInternetConnection()
          else if (widget.isOnline && widget.isRestricted)
            NoUser(),
          if (widget.isOnline && !widget.isRestricted)
            const Newsroom()
          else if (!widget.isOnline && !widget.isRestricted)
            NoInternetConnection()
          else if (widget.isOnline && widget.isRestricted)
            NoUser(),
          if (widget.isOnline && !widget.isRestricted)
            const Dashboard()
          else if (!widget.isOnline && !widget.isRestricted)
            NoInternetConnection()
          else if (widget.isOnline && widget.isRestricted)
            NoUser(),
          if (widget.isOnline && !widget.isRestricted)
            const QuizRoom()
          else if (!widget.isOnline && !widget.isRestricted)
            NoInternetConnection()
          else if (widget.isOnline && widget.isRestricted)
            NoUser(),
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
