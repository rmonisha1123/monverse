// ignore_for_file: library_private_types_in_public_api

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:monisha_portfolio/utils/constants.dart';
import 'package:monisha_portfolio/widgets/landing_screen_widget.dart';

import 'profile_screen.dart';
import 'journey_screen.dart';
import 'project_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarExpanded = true;
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarExpanded = _scrollController.hasClients &&
            _scrollController.offset < (300 - kToolbarHeight);
      });
    });
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          LandingScreenWidget(
              scrollController: _scrollController,
              isAppBarExpanded: _isAppBarExpanded),
          JourneyScreen(),
          // ExampleRoadMap(),
          ProjectScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react, // other styles: fixedCircle, flip, etc.
        backgroundColor: Apptheme.darkBlue,
        items: const [
          TabItem(
            icon: Icons.home,
            title: 'Home',
          ),
          TabItem(icon: Icons.work, title: 'Journey'),
          TabItem(icon: Icons.code, title: 'Project'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
