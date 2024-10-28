import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

import '../utils/constants.dart';
import '../utils/custom_elevated_button.dart';
import '../utils/shadow_effect.dart';
import '../widgets.dart';
import 'counter_widget.dart';
import 'current_experience.dart';
import 'custom_clip_banner.dart';
import 'skill_card.dart';

class LandingScreenWidget extends StatelessWidget {
  const LandingScreenWidget({
    super.key,
    required ScrollController scrollController,
    required bool isAppBarExpanded,
  })  : _scrollController = scrollController,
        _isAppBarExpanded = isAppBarExpanded;

  final ScrollController _scrollController;
  final bool _isAppBarExpanded;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController, // Attach the scroll controller
      slivers: [
        SliverAppBar(
          expandedHeight: 350,
          backgroundColor: const Color.fromARGB(255, 32, 42, 102),
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: AppFontText(
              text: "Welcome to MonVerse",
              color: _isAppBarExpanded
                  ? const Color.fromARGB(255, 32, 42, 102)
                  : Apptheme.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetPaths.selfPortrait),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Add gradient effect on the image
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color.fromARGB(255, 32, 42, 102).withOpacity(0.5),
                        const Color.fromARGB(255, 235, 233, 245)
                            .withOpacity(0.5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Below app bar contents
        SliverToBoxAdapter(
          child: Column(
            children: [
              // shadow effect
              ShadowEffect(
                startingColor: const Color.fromARGB(255, 165, 165, 165),
                endingColor: Apptheme.white.withOpacity(0),
              ),

              // below image contents
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 0, bottom: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppFontText(
                        text: "Hi, I'm ",
                        fontSize: 20,
                        color: Apptheme.black,
                      ),
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Monisha Ravikumar!',
                            textStyle: GoogleFonts.montserrat(
                              fontSize: 22,
                              color: Apptheme.black,
                            ),
                            speed: const Duration(milliseconds: 200),
                            cursor: '|',
                          ),
                          TypewriterAnimatedText(
                              'Full Stack Mobile App Developer',
                              textStyle: GoogleFonts.montserrat(
                                fontSize: 22,
                                color: Apptheme.black,
                              ),
                              speed: const Duration(milliseconds: 200),
                              cursor: '|',
                              textAlign: TextAlign.center),
                          TypewriterAnimatedText(
                            'Technical Lead',
                            textStyle: GoogleFonts.montserrat(
                              fontSize: 22,
                              color: Apptheme.black,
                            ),
                            speed: const Duration(milliseconds: 200),
                            cursor: '|',
                          ),
                          TypewriterAnimatedText(
                            'DevOps Engineer',
                            textStyle: GoogleFonts.montserrat(
                              fontSize: 22,
                              color: Apptheme.black,
                            ),
                            speed: const Duration(milliseconds: 200),
                            cursor: '|',
                          ),
                          TypewriterAnimatedText(
                            'Project Manager',
                            textStyle: GoogleFonts.montserrat(
                              fontSize: 22,
                              color: Apptheme.black,
                            ),
                            speed: const Duration(milliseconds: 200),
                            cursor: '|',
                          ),
                          TypewriterAnimatedText(
                            'Scrum Master',
                            textStyle: GoogleFonts.montserrat(
                              fontSize: 22,
                              color: Apptheme.black,
                            ),
                            speed: const Duration(milliseconds: 200),
                            cursor: '|',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // below animation content - colab
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: AppFontText(text: AppText.colabContent),
              ),

              // Button content - colab
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      backgroundColor: Apptheme.teal,
                      foregroundColor: Apptheme.white,
                      // text: AppFontText(text: "text"),
                      input: "Mail me",
                      fontColor: Apptheme.white,
                      fontSize: 18,
                      onPress: () {
                        toastification.show(
                            type: ToastificationType.error,
                            alignment: Alignment.bottomCenter,
                            context:
                                context, // optional if you use ToastificationWrapper
                            title: Text('Under Construction'),
                            autoCloseDuration: const Duration(seconds: 5),
                            showProgressBar: false);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      backgroundColor: Apptheme.teal,
                      foregroundColor: Apptheme.white,
                      input: "Hire Me",
                      fontColor: Apptheme.white,
                      fontSize: 18,
                      onPress: () {
                        toastification.show(
                            type: ToastificationType.error,
                            alignment: Alignment.bottomCenter,
                            context:
                                context, // optional if you use ToastificationWrapper
                            title: const Text('Under Construction'),
                            autoCloseDuration: const Duration(seconds: 5),
                            showProgressBar: false);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),

              // About me content
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Stack(
                  children: [
                    // Curved background using ClipPath
                    ClipPath(
                      clipper:
                          CustomClipBanner(), // CustomClipPath defined below
                      child: Container(
                        height: 375, // Adjust height for your design
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Apptheme.paleAmber.withOpacity(0.8),
                              Colors.amber.withOpacity(0.6)
                              // Apptheme.softAmber.withOpacity(0.6),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                    // Floating content above the curved background
                    const Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppFontText(
                              text: "About Me",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:
                                  Apptheme.softAmber, // Customize as per theme
                            ),
                            SizedBox(height: 10),
                            Flexible(
                              child: AppFontText(
                                text: AppText.aboutMe,
                                fontSize: 14,
                                // height: 1.5, // For better readability
                                color: Apptheme
                                    .black, // Adjust to your main text color
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // tech stack content
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppFontText(
                      text: "Tech Stack",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    AppFontText(
                      text: "Swipe to see more",
                      fontSize: 12,
                    )
                  ],
                ),
              ),
              // Add your content or data here
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20, top: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SkillCard(
                          imagePath: AssetPaths.flutterIcon, skill: 'Flutter'),
                      SkillCard(imagePath: AssetPaths.dartIcon, skill: 'Dart'),
                      SkillCard(
                          imagePath: AssetPaths.azureIcon, skill: 'Azure'),
                      SkillCard(imagePath: AssetPaths.awsIcon, skill: 'AWS'),
                      SkillCard(imagePath: AssetPaths.jiraIcon, skill: 'JIRA'),
                      SkillCard(
                          imagePath: AssetPaths.pythonIcon, skill: 'Python'),
                      SkillCard(
                          imagePath: AssetPaths.playStoreIcon,
                          skill: 'PlayStore Console'),
                      SkillCard(
                          imagePath: AssetPaths.appStoreIcon,
                          skill: 'AppStore Console'),
                      SkillCard(
                          imagePath: AssetPaths.firebaseIcon,
                          skill: 'Firebase'),
                      SkillCard(
                          imagePath: AssetPaths.androidStudioIcon,
                          skill: "Android Studio"),
                      SkillCard(
                          imagePath: AssetPaths.eclipseIcon, skill: "Eclipse"),
                      SkillCard(imagePath: AssetPaths.htmlIcon, skill: "HTML"),
                      SkillCard(
                          imagePath: AssetPaths.mySqlIcon, skill: "MySQL"),
                      SkillCard(
                          imagePath: AssetPaths.rStudioIcon, skill: "R Studio")
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AppFontText(
                    text: "Current Experience",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              // experience content
              const CurrentExperienceSection(),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: AppFontText(
                      text: "Achievements",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CounterWidget(title: 'Projects', count: 7),
                    CounterWidget(title: 'Years Experience', count: 2),
                    CounterWidget(title: 'Recognition', count: 3),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
