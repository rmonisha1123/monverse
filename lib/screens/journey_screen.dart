import 'package:flutter/material.dart';
import 'package:monisha_portfolio/utils/constants.dart';

import '../models/experience_model.dart';
import '../widgets/journey_widget.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({super.key});

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  final PageController _pageController = PageController();
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final experiences = [
      Experience(
          title: 'Full Stack Mobile App Developer',
          company: 'Cruxule Solutions Private Limited',
          location: 'Chennai',
          duration: 'Apr 2023 - Present',
          year: '2024',
          responsibilities: AppText.cruxuleSolutions),
      Experience(
        title: 'Software Engineer',
        company: 'Grhombus Technologies Private Limited',
        location: 'Chennai',
        duration: 'Dec 2021 - Apr 2023',
        year: '2023',
        responsibilities: AppText.softwareEngineer,
      ),
      Experience(
        title: 'Software Engineer - Trainee',
        company: 'Grhombus Technologies Private Limited',
        location: 'Chennai',
        duration: 'Oct 2021 - Dec 2021',
        year: '2021',
        responsibilities: AppText.softwareEngineerTrainee,
      ),
      Experience(
        title: 'Tutor',
        company: 'Virutcham Kidz Castle (Part-Time)',
        location: 'Chennai',
        duration: 'Nov 2019 - Aug 2020',
        year: '2020',
        responsibilities: AppText.tutor,
      ),
      // Add more experiences as needed
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: JourneyWidget(
          experiences: experiences,
          currentPage: _currentPage,
          pageController: _pageController),
    );
  }
}
