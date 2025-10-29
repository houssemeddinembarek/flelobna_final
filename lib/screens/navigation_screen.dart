import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/screens/documents/documents_screen.dart';
import 'package:flelobna/screens/course/list_courses.dart';
import 'package:flelobna/screens/settings/settings_screen.dart';
import 'package:flelobna/screens/video_screen.dart';
import 'package:flelobna/screens/video_screen12.dart';
import 'package:flelobna/screens/ai_chat/ai_chat_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  final List<Widget> _pages = [
    ListCourses(),
    VideoScreen(
      videoAssets: ['assets/video/video11.mp4'],
    ),
    VideoScreen12(
      videoAssets: ['assets/video/video12.mp4'],
    ),
    DocumentsScreen(),
    AiChatScreen(),
    SettingsScreen()
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size.width * 0.05),
            topRight: Radius.circular(size.width * 0.05),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size.width * 0.05),
            topRight: Radius.circular(size.width * 0.05),
          ),
          child: SafeArea(
            child: Container(
              height: size.height * 0.08,
              constraints: BoxConstraints(
                minHeight: 60,
                maxHeight: 75,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
                vertical: size.height * 0.008,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildNavItem(
                    size: size,
                    icon: Icons.menu_book_rounded,
                    label: 'Revues',
                    index: 0,
                    isActive: _currentIndex == 0,
                  ),
                  _buildNavItem(
                    size: size,
                    icon: Icons.play_circle_outline_rounded,
                    label: 'Vidéos',
                    index: 3,
                    isActive: _currentIndex == 3,
                  ),
                  _buildNavItem(
                    size: size,
                    icon: Icons.psychology_rounded,
                    label: 'IA',
                    index: 4,
                    isActive: _currentIndex == 4,
                  ),
                  _buildNavItem(
                    size: size,
                    icon: Icons.settings_rounded,
                    label: 'Profil',
                    index: 5,
                    isActive: _currentIndex == 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required Size size,
    required IconData icon,
    required String label,
    required int index,
    required bool isActive,
  }) {
    // Responsive sizing
    final double iconSize = size.width * (isActive ? 0.065 : 0.058);
    final double iconSizeClamped = iconSize.clamp(22.0, 28.0);
    
    final double fontSize = size.width * (isActive ? 0.029 : 0.026);
    final double fontSizeClamped = fontSize.clamp(10.0, 13.0);
    
    final double iconPadding = size.width * (isActive ? 0.02 : 0.015);
    final double iconPaddingClamped = iconPadding.clamp(6.0, 10.0);
    
    final double borderRadius = size.width * 0.03;
    final double borderRadiusClamped = borderRadius.clamp(10.0, 15.0);
    
    final double spacing = size.height * 0.004;
    final double spacingClamped = spacing.clamp(2.0, 4.0);
    
    return Expanded(
      child: InkWell(
        onTap: () {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        splashColor: AppColors.GreeFonce.withOpacity(0.1),
        highlightColor: AppColors.GreeFonce.withOpacity(0.05),
        borderRadius: BorderRadius.circular(borderRadiusClamped),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.005,
            horizontal: size.width * 0.01,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(iconPaddingClamped),
                decoration: BoxDecoration(
                  gradient: isActive
                      ? LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.GreeFonce,
                            AppColors.GreeMedium,
                          ],
                        )
                      : null,
                  color: isActive ? null : Colors.transparent,
                  borderRadius: BorderRadius.circular(borderRadiusClamped),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: AppColors.GreeFonce.withOpacity(0.35),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                            spreadRadius: 1,
                          ),
                        ]
                      : null,
                ),
                child: Icon(
                  icon,
                  size: iconSizeClamped,
                  color: isActive ? Colors.white : Colors.grey[600],
                ),
              ),
              SizedBox(height: spacingClamped),
              AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 250),
                style: TextStyle(
                  fontSize: fontSizeClamped,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
                  color: isActive ? AppColors.GreeFonce : Colors.grey[600],
                  letterSpacing: 0.2,
                ),
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
