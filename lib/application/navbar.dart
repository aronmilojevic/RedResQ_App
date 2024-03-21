import 'package:firebase_messaging/firebase_messaging.dart';
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
    double bottomNavBarHeight = MediaQuery.of(context).size.height * 0.12;
    double iconSize = bottomNavBarHeight * 0.6;

    return NavigationExample(
      isOnline: isOnline,
      isRestricted: isRestricted,
      iconSize: iconSize,
    );
  }
}

class NavigationExample extends StatefulWidget {
  final bool isOnline;
  final bool isRestricted;
  final double iconSize;

  const NavigationExample({
    Key? key,
    required this.isOnline,
    required this.isRestricted,
    required this.iconSize,
  }) : super(key: key);

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
    double bottomNavBarHeight = MediaQuery.of(context).size.height * 0.12;

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
        height: bottomNavBarHeight,
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
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
            items: [
              _buildNavItem(Icons.emoji_events),
              _buildNavItem(Icons.description),
              _buildNavItem(Icons.home),
              _buildNavItem(Icons.menu_book),
              _buildNavItem(Icons.lightbulb),
            ],
            elevation: 4,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Colors.white,
        size: MediaQuery.of(context).size.height * 0.036,
      ),
      label: '',
    );
  }
}


