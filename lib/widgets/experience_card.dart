// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:monisha_portfolio/utils/constants.dart';
import 'package:monisha_portfolio/widgets.dart';

import '../models/experience_model.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;
  final bool isActive;
  final double progress;

  const ExperienceCard({
    Key? key,
    required this.experience,
    required this.isActive,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(80, 32, 32, 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Container(
              //   width: 12,
              //   height: 12,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     shape: BoxShape.circle,
              //     border: Border.all(
              //       color: isActive
              //           ? Colors.deepPurple
              //           : Colors.deepPurple.withOpacity(0.3),
              //       width: 2,
              //     ),
              //   ),
              // ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppFontText(
                      text: experience.title,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 4),
                    AppFontText(
                      text: experience.company,
                      fontSize: 14,
                      color: Apptheme.grey,
                    ),
                    AppFontText(
                      text: experience.location,
                      fontSize: 12,
                      color: Apptheme.grey,
                    ),
                    AppFontText(
                      text: experience.duration,
                      fontSize: 12,
                      color: Apptheme.grey,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...experience.responsibilities.map((responsibility) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppFontText(
                    text: '• ',
                    fontSize: 16,
                  ),
                  Expanded(
                    child: AppFontText(
                      text: responsibility,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
