import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testsdk/models/cours.dart';
import 'package:testsdk/pages/instructeur_page.dart';
import 'package:testsdk/pages/list_courses.dart';
import 'package:testsdk/pages/video_screen.dart';
import 'package:testsdk/pages/video_screen12.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({
    Key? key,
  });

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _pages = [
    ListCourses(),
    VideoScreen(
      videoAssets: ['assets/video/video11.mp4'],
    ),
    VideoScreen12(
      videoAssets: ['assets/video/video12.mp4'],
    ),
    InstructeurPage()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Color(0xFF192E5B),
        child: Container(
          decoration: BoxDecoration(

              // borderRadius: BorderRadius.all(Radius.circular(25))
              ),
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Container(
                    // height: size.height * 0.05,
                    // width: size.width * 0.12,
                    child: ClipOval(
                  child: Image.asset(
                    'assets/images/apprenez.png',
                    width: size.width * 0.12,
                    height: size.width * 0.12,
                    fit: BoxFit.cover,
                  ),
                )),
                color: _currentIndex == 0 ? Colors.yellow : Colors.white,
                onPressed: () {
                  _pageController.jumpToPage(0);
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Container(
                  height: size.height * 0.06,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/bonvoyage11.jpg',
                      width: size.width * 0.12,
                      height: size.width * 0.12,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                color: _currentIndex == 1 ? Colors.yellow : Colors.white,
                onPressed: () {
                  _pageController.jumpToPage(1);
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
              IconButton(
                icon: Container(
                    height: size.height * 0.06,
                    child: Container(
                      // height: size.height * 0.05,
                      // width: size.width * 0.12,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/bonvoyage12.jpg',
                          width: size.width * 0.12,
                          height: size.width * 0.12,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                color: _currentIndex == 2 ? Colors.yellow : Colors.white,
                onPressed: () {
                  _pageController.jumpToPage(2);
                  setState(() {
                    _currentIndex = 2;
                  });
                },
              ),
              IconButton(
                icon: Container(
                    height: size.height * 0.06,
                    child: Image.asset(
                      'assets/icons/instructor.png',
                      color: _currentIndex == 3
                          ? Colors.cyan.withOpacity(0.7)
                          : Colors.white,
                    )),
                onPressed: () {
                  _pageController.jumpToPage(3);
                  setState(() {
                    _currentIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
