import 'package:flutter/material.dart';
import 'package:monisha_portfolio/utils/constants.dart';

import '../widgets/animation_project_card.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        "name": "WETRACT",
        "description":
            "WETRACT is a farm equipment rental and hiring software that provides an easy-to-use platform for both farmers and equipment owners to make the most of their equipment in a profitable and mutually beneficial manner.",
        "period": "Dec 2021 - Present",
        "full_description": AppText.wetract
      },
      {
        "name": "CRUXIN",
        "description":
            "Cruxin is a business management app for employee, asset, project, leave, and attendance tracking, designed to boost productivity with an intuitive, on-the-go interface.",
        "period": "Feb 2024 - Present",
        "full_description": AppText.cruxin,
      },
      {
        "name": "UNITRICS",
        "description":
            "A lightweight app for all your unit conversion needs, offering a simple, ad-free, and responsive experience with no extra permissions required.",
        "period": "Sept 2023 - Nov 2023",
        "full_description": AppText.unitrics
      },
      {
        "name": "VOICESCRIBE",
        "description":
            "VOICESCRIBE simplifies audio transcription with cloud storage, accurate transcriptions via Google Cloud Speech-to-Text, and a user-friendly interface. It supports text and audio responses, offering a reliable and efficient solution.",
        "period": "Oct 2023 - Jan 2024",
        "full_description": AppText.voicescribe
      },
      {
        "name": "EJAL MINI",
        "description": "Need to add description",
        "period": "Jul 2023 - Oct 2023",
        "full_description": AppText.ejalMini
      },
      {
        "name": "PROQ CLUB",
        "description":
            "Utilizing a mobile based MLM model for wealth creation, incorporating blockchain for secure transactions, with various commission strategies",
        "period": "Apr 2023 - May 2024",
        "full_description": AppText.proq
      },
      {
        "name": "TRACKER",
        "description":
            "The TRACKER project enables real-time object detection using advanced video analysis and image understanding, improving on traditional methods with sophisticated detectors and classifiers.",
        "period": "Dec 2020 - Mar 2021",
        "full_description": AppText.tracker
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Apptheme.paleCoral, Apptheme.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return AnimatedProjectCard(
                name: project['name'] as String,
                description: project['description'] as String,
                period: project['period'] as String,
                fullDescription: project['full_description'] as List,
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
