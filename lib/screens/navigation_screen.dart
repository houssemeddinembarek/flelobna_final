import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/controller/video_controller.dart';
import 'package:flelobna/screens/documents/documents_screen.dart';
import 'package:flelobna/screens/instructeur_page.dart';
import 'package:flelobna/screens/course/list_courses.dart';
import 'package:flelobna/screens/settings/settings_screen.dart';
import 'package:flelobna/screens/video_screen.dart';
import 'package:flelobna/screens/video_screen12.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  final box = GetStorage();

  PageController _pageController = PageController(initialPage: 0);
  VideoController videoController = Get.put(VideoController());

  final List<Widget> _pages = [
    ListCourses(),
    VideoScreen(
      videoAssets: ['assets/video/video11.mp4'],
    ),
    VideoScreen12(
      videoAssets: ['assets/video/video12.mp4'],
    ),
    DocumentsScreen(),
    // InstructeurPage(),

    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: size.height * 0.09,
        elevation: 0,
        color: AppColors.blueBgTop.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: IconButton(
                // padding: EdgeInsets.all(5),
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: size.width * 0.05,
                      width: size.width * 0.05,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/icons/instructor.png',
                          fit: BoxFit.cover,
                          color: _currentIndex == 0
                              ? Colors.cyan.withOpacity(0.7)
                              : Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Revues',
                      style: TextStyle(
                        fontSize: size.width * 0.02,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueTextColor,
                      ),
                    ),
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
            ),
            Expanded(
              child: IconButton(
                // padding: EdgeInsets.all(5),
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: size.width * 0.05,
                      width: size.width * 0.05,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/icons/video.png',
                          fit: BoxFit.cover,
                          color: _currentIndex == 3
                              ? Colors.cyan.withOpacity(0.7)
                              : Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Videos',
                      style: TextStyle(
                        fontSize: size.width * 0.02,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueTextColor,
                      ),
                    ),
                  ],
                ),
                color: _currentIndex == 3 ? Colors.yellow : Colors.white,
                onPressed: () {
                  _pageController.jumpToPage(3);
                  setState(() {
                    _currentIndex = 3;
                  });
                },
              ),
            ),
            Expanded(
              child: IconButton(
                // padding: EdgeInsets.all(5),
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: size.width * 0.05,
                      width: size.width * 0.05,
                      child: Icon(
                        Icons.settings,
                        size: size.width * 0.041,
                        color: _currentIndex == 4
                            ? Colors.cyan.withOpacity(0.7)
                            : Colors.white,
                      ),
                    ),
                    Text(
                      'Paramètre',
                      style: TextStyle(
                        fontSize: size.width * 0.02,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueTextColor,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  _pageController.jumpToPage(4);
                  setState(() {
                    _currentIndex = 4;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
