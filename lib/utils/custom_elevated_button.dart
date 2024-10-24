// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:monisha_portfolio/widgets.dart';

class CustomElevatedButton extends StatelessWidget {
  Color? backgroundColor;
  Color? foregroundColor;
  String input;
  double fontSize;
  Color fontColor;
  Function() onPress;
  int? radius;
  CustomElevatedButton(
      {super.key,
      required this.onPress,
      this.backgroundColor,
      this.foregroundColor,
      required this.fontSize,
      required this.fontColor,
      required this.input,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPress,
      child: AppFontText(
        text: input,
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }
}
