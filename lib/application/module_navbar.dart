import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redresq_app/application/Module_Ressources/modules_page.dart';
import 'package:redresq_app/application/Module_Ressources/table_of_contents.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/application/Module_Ressources/modules_page.dart';
import 'package:redresq_app/API_Ressources/Moduless/book.dart';

class ModuleNavbar extends StatelessWidget {
  final String disasterType;

  const ModuleNavbar({Key? key, required this.disasterType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleNavbarState(disasterType: disasterType);
  }
}

class ModuleNavbarState extends StatefulWidget {
  final String disasterType;

  const ModuleNavbarState({Key? key, required this.disasterType})
      : super(key: key);

  @override
  State<ModuleNavbarState> createState() =>
      _NavigationExampleState(disasterType: disasterType);
}

class _NavigationExampleState extends State<ModuleNavbarState> {
  int currentPageIndex = 0;
  final String disasterType;
  final PageController _pageController = PageController(initialPage: 0);

  _NavigationExampleState({required this.disasterType});

  late Future<Book> _bookData;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    _bookData = _loadBook(disasterType);

    _bookData.then((book) {
      setState(() {
        pages.add(TableOfContents(disasterType: disasterType));
        pages += List.generate(
          book.page.length,
          (index) => _buildDynamicDisasterPage(book, index, disasterType),
        );
      });
    });
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
          setCurrentPageIndex(index);
        },
        children: pages,
      ),
      bottomNavigationBar: Container(
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
                  '${currentPageIndex + 1} / ${pages.length}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    if (currentPageIndex < pages.length - 1) {
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

Widget _buildDynamicDisasterPage(
    Book book, int pageIndex, String disasterType) {
  return DynamicDisasterPage(
    disasterType: disasterType,
    pageIndex: pageIndex,
  );
}

Future<Book> _loadBook(String disasterType) async {
  try {
    String jsonString = await rootBundle
        .loadString('lib/assets/learning_modules/$disasterType.json');
    if (jsonString.isNotEmpty) {
      Map<String, dynamic> jsonData = json.decode(jsonString);
      return Book.fromJson(jsonData);
    } else {
      throw "Error: JSON data is empty.";
    }
  } catch (error) {
    throw "Error loading book: $error";
  }
}
