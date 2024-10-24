import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExperienceCard extends StatelessWidget {
  final String year;
  final String role;
  final List<String> description;
  final bool isFirst;
  final bool isLast;

  ExperienceCard({
    required this.year,
    required this.role,
    required this.description,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: const LineStyle(
        color: Colors.blue,
        thickness: 4,
      ),
      afterLineStyle: const LineStyle(
        color: Colors.blue,
        thickness: 4,
      ),
      indicatorStyle: IndicatorStyle(
        width: 40,
        height: 40,
        indicator: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              year,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ...description.map((desc) => Text("• $desc")).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// class ExperienceCard extends StatelessWidget {
//   final String year;
//   final String role;
//   final List<String> description;

//   ExperienceCard(
//       {required this.year, required this.role, required this.description});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               year,
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue),
//             ),
//             SizedBox(height: 8),
//             Text(
//               role,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             ...description.map((desc) => Text("• $desc")).toList(),
//           ],
//         ),
//       ),
//     );
//   }
// }
