import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/models/course.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DetailCourse extends StatelessWidget {
  DetailCourse({Key? key, required this.course});

  Course course;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Document PDF',
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            letterSpacing: size.width * 0.003,
            color: AppColors.blueTextColor,
            // decoration: TextDecoration.underline,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.blueBgTop,
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.87,
            width: size.width,
            child: SfPdfViewer.asset(
              course.pathPdf,
            ),
          ),
        ],
      ),
    );
  }
}
