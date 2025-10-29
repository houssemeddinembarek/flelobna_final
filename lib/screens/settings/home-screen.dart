import 'package:flelobna/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    // Responsive calculations with clamping
    final double horizontalPadding = (size.width * 0.05).clamp(16.0, 24.0);
    final double cardPadding = (size.width * 0.06).clamp(20.0, 32.0);
    final double borderRadius = (size.width * 0.05).clamp(16.0, 24.0);
    
    final double headerFontSize = (size.width * 0.065).clamp(20.0, 28.0);
    final double titleFontSize = (size.width * 0.042).clamp(14.0, 18.0);
    final double nameFontSize = (size.width * 0.042).clamp(14.0, 18.0);
    final double subtitleFontSize = (size.width * 0.038).clamp(13.0, 16.0);
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.blueBgTop,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Équipe Administrative',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: (size.width * 0.05).clamp(18.0, 22.0),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.blueBgTop,
              AppColors.GreeFonce,
              AppColors.blueBgBottom,
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(horizontalPadding),
            child: Container(
              padding: EdgeInsets.all(cardPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 30,
                    offset: Offset(0, 15),
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: (size.width * 0.08).clamp(24.0, 40.0),
                        vertical: (size.height * 0.02).clamp(12.0, 20.0),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.GreeFonce, AppColors.GreeMedium],
                        ),
                        borderRadius: BorderRadius.circular(borderRadius * 0.75),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.GreeFonce.withOpacity(0.4),
                            blurRadius: 15,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "تحت إشراف",
                            style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: size.width * 0.15,
                            height: 3,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: (size.height * 0.03).clamp(20.0, 30.0)),
                    
                    // Team Member 1
                    _buildTeamMember(
                      size: size,
                      titleFontSize: titleFontSize,
                      nameFontSize: nameFontSize,
                      subtitleFontSize: subtitleFontSize,
                      title: "الموجه العام لمادة اللغة الفرنسية",
                      name: "أ/ أنور الكندري",
                      subtitle: null,
                    ),
                    
                    _buildDivider(size),
                    
                    // Team Member 2
                    _buildTeamMember(
                      size: size,
                      titleFontSize: titleFontSize,
                      nameFontSize: nameFontSize,
                      subtitleFontSize: subtitleFontSize,
                      title: "الموجه الفني الأول لمادة اللغة الفرنسية",
                      name: "د/ سعود الشمري",
                      subtitle: "( منطقة الأحمدي التعليمية )",
                    ),
                    
                    _buildDivider(size),
                    
                    // Team Member 3
                    _buildTeamMember(
                      size: size,
                      titleFontSize: titleFontSize,
                      nameFontSize: nameFontSize,
                      subtitleFontSize: subtitleFontSize,
                      title: "الموجهة الفنية لمادة اللغة الفرنسية",
                      name: "أ/ رفا القناعي",
                      subtitle: "( منطقة الأحمدي التعليمية )",
                    ),
                    
                    _buildDivider(size),
                    
                    // Team Member 4
                    _buildTeamMember(
                      size: size,
                      titleFontSize: titleFontSize,
                      nameFontSize: nameFontSize,
                      subtitleFontSize: subtitleFontSize,
                      title: "رئيس قسم اللغة الفرنسية",
                      name: "أ/روضة حمادي بوجنيح",
                      subtitle: "( ثانوية لبنى بنت الحارث )",
                    ),
                    
                    _buildDivider(size),
                    
                    // Team Member 5
                    _buildTeamMember(
                      size: size,
                      titleFontSize: titleFontSize,
                      nameFontSize: nameFontSize,
                      subtitleFontSize: subtitleFontSize,
                      title: "مديرة المدرسة",
                      name: "أ/ منيره ابراهيم ابوحمره",
                      subtitle: "( ثانوية لبنى بنت الحارث )",
                    ),
                    
                    SizedBox(height: (size.height * 0.02).clamp(12.0, 20.0)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildTeamMember({
    required Size size,
    required double titleFontSize,
    required double nameFontSize,
    required double subtitleFontSize,
    required String title,
    required String name,
    String? subtitle,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: (size.height * 0.015).clamp(10.0, 16.0),
        horizontal: (size.width * 0.03).clamp(10.0, 16.0),
      ),
      decoration: BoxDecoration(
        color: AppColors.blueBgTop.withOpacity(0.08),
        borderRadius: BorderRadius.circular((size.width * 0.03).clamp(10.0, 16.0)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.blueTextColor,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: (size.height * 0.008).clamp(4.0, 8.0)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: (size.width * 0.04).clamp(12.0, 20.0),
              vertical: (size.height * 0.008).clamp(6.0, 10.0),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.GreeFonce.withOpacity(0.15),
                  AppColors.GreeMedium.withOpacity(0.15),
                ],
              ),
              borderRadius: BorderRadius.circular((size.width * 0.025).clamp(8.0, 12.0)),
            ),
            child: Text(
              name,
              style: TextStyle(
                fontSize: nameFontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.GreeFonce,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (subtitle != null) ...[
            SizedBox(height: (size.height * 0.006).clamp(4.0, 6.0)),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: subtitleFontSize,
                fontWeight: FontWeight.w600,
                color: AppColors.blueTextColor.withOpacity(0.7),
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
  
  Widget _buildDivider(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: (size.height * 0.02).clamp(12.0, 20.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.GreeFonce.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
