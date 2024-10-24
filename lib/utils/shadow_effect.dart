// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ShadowEffect extends StatelessWidget {
  Color startingColor;
  Color endingColor;
  ShadowEffect({required this.startingColor, required this.endingColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minHeight: 10, minWidth: 10, maxHeight: 30, maxWidth: 1000),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [startingColor, endingColor])),
    );
  }
}
