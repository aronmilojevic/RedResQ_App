import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class ModuleNavbar extends StatelessWidget {
  const ModuleNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleNavbarState();
  }
}

class ModuleNavbarState extends StatefulWidget {
  const ModuleNavbarState({Key? key}) : super(key: key);

  @override
  State<ModuleNavbarState> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<ModuleNavbarState> {
  int currentPageIndex = 1;

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
          Container(color: Colors.blue),
          Container(color: Colors.blue),
          Container(color: Colors.blue),
          Container(color: Colors.blue),
          Container(color: Colors.blue)
        ],
      ),
      bottomNavigationBar: Flexible(
        flex: 1,
        child: Container(
          height: 90,
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
            child: Container(
              color: myRedColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      if (currentPageIndex > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                  Text(
                    '$currentPageIndex / 5',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      if (currentPageIndex > 0) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
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
