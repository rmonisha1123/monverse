import 'package:flutter/material.dart';
import 'package:monisha_portfolio/utils/constants.dart';
import 'package:monisha_portfolio/widgets.dart';

class CurrentExperienceSection extends StatelessWidget {
  const CurrentExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Card(
        elevation: 2,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: Row(
            children: [
              // Floating Company Logo
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Apptheme.teal,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Apptheme.teal.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Apptheme.white,
                    backgroundImage: AssetImage(AssetPaths.currentCompanyLogo),
                  ),
                ),
              ),

              // Vertical Divider Line
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  width: 2,
                  height: 100,
                  color: Apptheme.teal,
                ),
              ),

              // Experience Details
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Company Name
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: AppFontText(
                        text: AppText.currentCompanyName,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Position Title
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: AppFontText(
                        text: AppText.currentPosition,
                        fontSize: 14,
                      ),
                    ),

                    // Work Type and Duration
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: const Row(
                        children: [
                          Icon(Icons.work, color: Apptheme.teal, size: 18),
                          SizedBox(width: 5),
                          AppFontText(
                            text:
                                "${AppText.currentCompanyWorkType} . ${AppText.currentCompanyWorkExp}",
                            fontSize: 13,
                            color: Apptheme.grey,
                          ),
                        ],
                      ),
                    ),

                    // Location
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Apptheme.teal, size: 18),
                        SizedBox(width: 5),
                        AppFontText(
                          text: AppText.currentCompanyLocation,
                          fontSize: 13,
                          color: Apptheme.grey,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
