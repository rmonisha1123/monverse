import 'package:flutter/material.dart';
import 'package:monisha_portfolio/utils/constants.dart';
import 'package:monisha_portfolio/widgets.dart';

import 'curvedline_painter.dart';

class TimelinePainter extends StatelessWidget {
  final int itemCount;
  final double currentPage;
  final List<String> years;

  const TimelinePainter({
    Key? key,
    required this.itemCount,
    required this.currentPage,
    required this.years,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Curved line
        CustomPaint(
          size: const Size(80, double.infinity),
          painter: CurvedLinePainter(
            itemCount: itemCount,
            progress: currentPage / (itemCount - 1),
          ),
        ),
        // Years
        ...List.generate(itemCount, (index) {
          return Positioned(
            left: 35,
            top: MediaQuery.of(context).size.height * (index / (itemCount)),
            child: Container(
              height: MediaQuery.of(context).size.height / itemCount,
              alignment: Alignment.center,
              child: AppFontText(
                text: years[index],
                color: (currentPage.round() == index)
                    ? Apptheme.deepPurple
                    : Apptheme.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }),
      ],
    );
  }
}
