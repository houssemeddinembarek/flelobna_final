import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:testsdk/models/cours.dart';

class DetailCourse extends StatelessWidget {
  DetailCourse({Key? key, required this.course});

  Course course;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        title: Text('Document PDF'),
        elevation: 0,
        backgroundColor: Color(0xFF192E5B),
      ),
      body: Column(
        children: [
          Container(
            child: PDF.asset(
              course.pathPdf,
              height: size.height*0.88,
              width: size.width,
            ),
          ),
        ],
      ),
    );
  }
}
