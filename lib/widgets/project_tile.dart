import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  final String image;
  final String title;

  ProjectTile({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Image.asset(image, width: 150, height: 100, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
