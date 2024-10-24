import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:monisha_portfolio/utils/constants.dart';
import 'package:monisha_portfolio/widgets.dart';

class IntroPage3 extends PageViewModel {
  IntroPage3()
      : super(
            titleWidget: const Column(
              children: [
                Gap(80),
                AppFontText(
                  text: "Let's Collaborate",
                  textAlign: TextAlign.center,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Apptheme.teal,
                ),
              ],
            ),
            bodyWidget: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  const Gap(20),
                  SizedBox(
                    child: Image.asset(
                      AssetPaths.introPage3,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      width: 500,
                    ),
                  ),
                  const Gap(20),
                  const AppFontText(
                    text:
                        "Reach out to me for opportunities, collaborations, or to learn more about my work. Let’s create something amazing together!",
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    color: Apptheme.softAmber,
                  ),
                ],
              ),
            ),
            decoration: const PageDecoration(pageColor: Apptheme.white));
}
