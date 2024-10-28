// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:monisha_portfolio/widgets/landing_screen_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarExpanded = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        // Check if the app bar is expanded or collapsed
        _isAppBarExpanded = _scrollController.hasClients &&
            _scrollController.offset < (300 - kToolbarHeight);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LandingScreenWidget(
          scrollController: _scrollController,
          isAppBarExpanded: _isAppBarExpanded),
    );
  }
}
