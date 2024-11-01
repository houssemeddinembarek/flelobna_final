import 'package:flelobna/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get_storage/get_storage.dart';

class SettingsButton extends StatelessWidget {
  SettingsButton(
      {super.key,
      this.text,
      this.textColor,
      this.icon,
      this.iconColor,
      this.onTap});

  final String? text;
  final IconData? icon;
  Color? iconColor;
  Color? textColor;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: size.width * 0.9,
          height: size.height * 0.06,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: AppColors.whiteFlue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: size.width * 0.04,
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              Text(
                text.toString(),
                style: TextStyle(
                  fontSize: size.width * 0.03,
                  fontWeight: FontWeight.bold,
                  letterSpacing: size.width * 0.003,
                  color: textColor,
                  // decoration: TextDecoration.underline,
                ),
              ),
            ],
          )),
    );
  }
}
