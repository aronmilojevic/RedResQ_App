import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  Color backgroundColor = Colors.white; // Initial background color
  void changeBackgroundColor(int index) {
    // Change background color based on the selected index
    setState(() {
      switch (index) {
        default:
          backgroundColor = Colors.white;

        // Default color
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 15,
          ),
          child: Container(
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
                      setState(() {
                        currentPageIndex = index;
                        changeBackgroundColor(index); // Change background color
                      });
                    },
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
                  )))),
      body: Container(
        color: backgroundColor, // Change background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
