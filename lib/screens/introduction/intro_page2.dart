import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:monisha_portfolio/utils/constants.dart';
import 'package:monisha_portfolio/widgets.dart';

class IntroPage2 extends PageViewModel {
  IntroPage2()
      : super(
            titleWidget: const Column(
              children: [
                Gap(10),
                AppFontText(
                  text: "Skills that Make a Difference",
                  textAlign: TextAlign.center,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Apptheme.teal,
                ),
              ],
            ),
            bodyWidget: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  // const Gap(20),
                  SizedBox(
                    child: Image.asset(
                      AssetPaths.introPage2,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      width: 500,
                    ),
                  ),
                  const Gap(10),
                  const AppFontText(
                    text:
                        "From Flutter and Dart to Project management, see how I bring creative ideas to life with expertise and precision.",
                    textAlign: TextAlign.center,
                    fontSize: 16,
                    color: Apptheme.softAmber,
                  ),
                ],
              ),
            ),
            decoration: const PageDecoration(pageColor: Apptheme.white));
}
