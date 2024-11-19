import 'package:flutter/material.dart';

import '../models/experience_model.dart';
import 'experience_card.dart';
import 'timeline_painter.dart';

class JourneyWidget extends StatelessWidget {
  const JourneyWidget({
    super.key,
    required this.experiences,
    required double currentPage,
    required PageController pageController,
  })  : _currentPage = currentPage,
        _pageController = pageController;

  final List<Experience> experiences;
  final double _currentPage;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Timeline line with years
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: SizedBox(
            width: 80,
            child: TimelinePainter(
              itemCount: experiences.length,
              currentPage: _currentPage,
              years: experiences.map((e) => e.year).toList(),
            ),
          ),
        ),
        // PageView
        PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: experiences.length,
          itemBuilder: (context, index) {
            return ExperienceCard(
              experience: experiences[index],
              isActive: _currentPage.round() == index,
              progress: 1 - (_currentPage - index).abs().clamp(0.0, 1.0),
            );
          },
        ),
      ],
    );
  }
}
