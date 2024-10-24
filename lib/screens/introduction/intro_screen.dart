import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:monisha_portfolio/screens/landing_screen.dart';
import 'package:monisha_portfolio/screens/introduction/intro_page1.dart';
import 'package:monisha_portfolio/screens/introduction/intro_page2.dart';
import 'package:monisha_portfolio/screens/introduction/intro_page3.dart';
import 'package:monisha_portfolio/utils/constants.dart';
import 'package:monisha_portfolio/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  Future<void> completeIntroduction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('introSeen', true);
  }

  void onIntroductionDone() async {
    await completeIntroduction();
    if (mounted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LandingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Apptheme.white,
      skipStyle: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 15),
          ),
          foregroundColor: WidgetStateProperty.all(Apptheme.softAmber)),
      allowImplicitScrolling: true,
      animationDuration: 600,
      pages: [IntroPage1(), IntroPage2(), IntroPage3()],
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      controlsPadding: const EdgeInsets.all(10),
      skip: const AppFontText(
        text: "Skip",
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: Apptheme.softAmber,
      ),
      next: const Icon(
        Icons.keyboard_arrow_right_outlined,
        color: Apptheme.white,
        size: 25,
      ),
      nextStyle: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(40, 40)),
        backgroundColor: WidgetStateProperty.all(Apptheme.softAmber),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      curve: Curves.linearToEaseOut,
      done: const AppFontText(
        text: "Done",
        fontWeight: FontWeight.w500,
        color: Apptheme.softAmber,
      ),
      onDone: onIntroductionDone,
      dotsDecorator: DotsDecorator(
          size: const Size.square(7),
          color: Apptheme.paleCoral,
          activeColor: Apptheme.paleAmber,
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
    );
  }
}
