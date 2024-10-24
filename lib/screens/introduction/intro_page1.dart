import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:monisha_portfolio/utils/constants.dart';
import 'package:monisha_portfolio/widgets.dart';

class IntroPage1 extends PageViewModel {
  IntroPage1()
      : super(
            titleWidget: const Column(
              children: [
                Gap(80),
                AppFontText(
                  text: "Welcome to MonVerse!",
                  textAlign: TextAlign.center,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Apptheme.teal,
                )
              ],
            ),
            bodyWidget: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  const Gap(20),
                  SizedBox(
                    child: Image.asset(
                      AssetPaths.introPage1,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      width: 500,
                    ),
                  ),
                  const Gap(30),
                  const AppFontText(
                    text:
                        "Explore my journey as a Full Stack Mobile App Developer and discover the projects that define my passion.",
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    color: Apptheme.softAmber,
                  ),
                ],
              ),
            ),
            decoration: const PageDecoration(pageColor: Apptheme.white));
}
