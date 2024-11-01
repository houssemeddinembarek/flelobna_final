import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LineBar extends StatelessWidget {
  LineBar({Key? key, required this.width}) : super(key: key);

  double width;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: width,
      height: size.height * 0.003,
      color: Colors.white,
    );
  }
}
