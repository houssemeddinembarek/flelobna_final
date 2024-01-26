import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/screens/instructeur_page.dart';
import 'package:flelobna/screens/list_courses.dart';
import 'package:flelobna/screens/video_screen.dart';
import 'package:flelobna/screens/video_screen12.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
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
        color: AppColors.blueBgTop.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(Radius.circular(25))
              ),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Column(
                  children: [
                    Container(
                        height: size.width * 0.06,
                        width: size.width * 0.06,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/apprenez.png',
                            width: size.width * 0.12,
                            height: size.width * 0.12,
                            fit: BoxFit.cover,
                          ),
                        )),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Text(
                      'Liste des PDF',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueTextColor,
                      ),
                    )
                  ],
                ),
                color: _currentIndex == 0 ? Colors.yellow : Colors.white,
                onPressed: () {
                  _pageController.jumpToPage(0);
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Column(
                  children: [
                    Container(
                      height: size.width * 0.06,
                      width: size.width * 0.06,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/bonvoyage11.jpg',
                          width: size.width * 0.12,
                          height: size.width * 0.12,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Text(
                      '11 éme Année',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueTextColor,
                      ),
                    )
                  ],
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
                    child: Column(
                      children: [
                        Container(
                          height: size.width * 0.06,
                          width: size.width * 0.06,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/bonvoyage12.jpg',
                              width: size.width * 0.12,
                              height: size.width * 0.12,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          '12 éme Année',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blueTextColor,
                          ),
                        )
                      ],
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
                icon: Column(
                  children: [
                    Container(
                        height: size.width * 0.06,
                        width: size.width * 0.06,
                        child: Image.asset(
                          'assets/icons/instructor.png',
                          color: _currentIndex == 3
                              ? Colors.cyan.withOpacity(0.7)
                              : Colors.white,
                        )),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Text(
                      'Equipe de Travail',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueTextColor,
                      ),
                    )
                  ],
                ),
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
