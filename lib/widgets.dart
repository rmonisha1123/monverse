import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monisha_portfolio/utils/constants.dart';

class AppFontText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final FontStyle? fontStyle;
  final maxlines;

  const AppFontText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Apptheme.black,
    this.textAlign = TextAlign.start,
    this.fontStyle = FontStyle.normal,
    this.maxlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color,
        ),
      ),
      maxLines: maxlines,
    );
  }
}
