import 'package:flutter/material.dart';
import 'package:monisha_portfolio/utils/constants.dart';
import 'package:monisha_portfolio/widgets.dart';

class CounterWidget extends StatelessWidget {
  final String title;
  final int count;

  const CounterWidget({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppFontText(
          text: '$count',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Apptheme.softAmber,
        ),
        const SizedBox(height: 5),
        AppFontText(
          text: title,
          fontSize: 12,
        )
      ],
    );
  }
}
