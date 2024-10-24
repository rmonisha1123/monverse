import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final String title;
  final int count;

  CounterWidget({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$count',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
