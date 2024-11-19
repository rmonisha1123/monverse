import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Animation
          AnimatedBackground(),
          Column(
            children: [
              const SizedBox(height: 50),
              // Profile Header
              AnimatedProfileHeader(),
              const SizedBox(height: 30),
              // PageView Carousel for Personal Info Sections
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: [
                    ProfileCard(
                      title: 'About Me',
                      content:
                          'I am a dedicated professional, passionate about achieving excellence in all areas...',
                      icon: Icons.person,
                    ),
                    ProfileCard(
                      title: 'Education',
                      content:
                          'Completed MCA at Anna University and BCA at M.O.P. Vaishnav College...',
                      icon: Icons.school,
                    ),
                    ProfileCard(
                      title: 'Hobbies',
                      content:
                          'Reading, Traveling, Exploring new technologies...',
                      icon: Icons.sports_soccer,
                    ),
                    ProfileCard(
                      title: 'Family Background',
                      content:
                          'Living in a joint family with a strong sense of responsibility and care...',
                      icon: Icons.home,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Icon Indicators for Each Page
              SectionIndicator(currentPage: _currentPage),
              const SizedBox(height: 20),
            ],
          ),
          // Floating Buttons for Page Navigation
          Positioned(
            left: 10,
            top: MediaQuery.of(context).size.height * 0.5,
            child: FloatingActionButton(
              onPressed: () {
                if (_currentPage > 0) _goToPage(_currentPage - 1);
              },
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
            right: 10,
            top: MediaQuery.of(context).size.height * 0.5,
            child: FloatingActionButton(
              onPressed: () {
                if (_currentPage < 3) _goToPage(_currentPage + 1);
              },
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Profile Card for each section
class ProfileCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const ProfileCard(
      {required this.title, required this.content, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blueAccent),
            const SizedBox(height: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Background Animation - same as previous design
class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  final List<List<Color>> _gradients = [
    [Colors.blue, Colors.purple],
    [Colors.purple, Colors.indigo],
    [Colors.indigo, Colors.deepPurple],
    [Colors.deepPurple, Colors.blue],
  ];
  int _currentGradientIndex = 0;

  @override
  void initState() {
    super.initState();
    _cycleBackground();
  }

  void _cycleBackground() {
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        _currentGradientIndex = (_currentGradientIndex + 1) % _gradients.length;
      });
      _cycleBackground();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 10),
      curve: Curves.linear,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _gradients[_currentGradientIndex],
        ),
      ),
    );
  }
}

// Profile Header (as before)
class AnimatedProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedDefaultTextStyle(
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.blueAccent),
          duration: const Duration(milliseconds: 300),
          child: const Text('Monisha Ravikumar'),
        ),
        AnimatedDefaultTextStyle(
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.grey[700],
              fontStyle: FontStyle.italic),
          duration: const Duration(milliseconds: 300),
          child: const Text('Full Stack Mobile App Developer'),
        ),
      ],
    );
  }
}

// Section Indicator for PageView
class SectionIndicator extends StatelessWidget {
  final int currentPage;

  const SectionIndicator({required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.person,
            color: currentPage == 0 ? Colors.blueAccent : Colors.grey),
        const SizedBox(width: 10),
        Icon(Icons.school,
            color: currentPage == 1 ? Colors.blueAccent : Colors.grey),
        const SizedBox(width: 10),
        Icon(Icons.sports_soccer,
            color: currentPage == 2 ? Colors.blueAccent : Colors.grey),
        const SizedBox(width: 10),
        Icon(Icons.home,
            color: currentPage == 3 ? Colors.blueAccent : Colors.grey),
      ],
    );
  }
}



// ---------- gradient effect design -------------

// import 'package:flutter/material.dart';
// import 'package:monisha_portfolio/widgets.dart'; // Assumes custom widgets like AppFontText

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Animation
//           AnimatedBackground(),
//           Column(
//             children: [
//               const SizedBox(height: 50),
//               // Animated Header Section without Image
//               AnimatedProfileHeader(),
//               const SizedBox(height: 30),
//               // Personal Information Cards
//               Expanded(
//                 child: ListView(
//                   padding: const EdgeInsets.all(16.0),
//                   children: [
//                     InfoCard(
//                       title: 'About Me',
//                       content:
//                           'I am a detail-driven professional with a passion for Flutter and Dart development...',
//                       icon: Icons.person,
//                     ),
//                     InfoCard(
//                       title: 'Education',
//                       content:
//                           'MCA from Anna University, BCA from M.O.P. Vaishnav College...',
//                       icon: Icons.school,
//                     ),
//                     InfoCard(
//                       title: 'Skills',
//                       content: 'Flutter, Dart, Firebase, and more...',
//                       icon: Icons.code,
//                     ),
//                     InfoCard(
//                       title: 'Hobbies',
//                       content: 'Reading, Coding, Traveling...',
//                       icon: Icons.sports_basketball,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Social Links with Interactive Icons
//               SocialLinks(),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Animated Background
// class AnimatedBackground extends StatefulWidget {
//   @override
//   _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
// }

// class _AnimatedBackgroundState extends State<AnimatedBackground> {
//   final List<List<Color>> _gradients = [
//     [Colors.blue, Colors.purple],
//     [Colors.purple, Colors.indigo],
//     [Colors.indigo, Colors.deepPurple],
//     [Colors.deepPurple, Colors.blue],
//   ];
//   int _currentGradientIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _cycleBackground();
//   }

//   void _cycleBackground() {
//     Future.delayed(const Duration(seconds: 10), () {
//       setState(() {
//         _currentGradientIndex = (_currentGradientIndex + 1) % _gradients.length;
//       });
//       _cycleBackground();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(seconds: 10),
//       curve: Curves.linear,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: _gradients[_currentGradientIndex],
//         ),
//       ),
//     );
//   }
// }

// // Animated Header without Image
// class AnimatedProfileHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AnimatedDefaultTextStyle(
//           style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//               fontWeight: FontWeight.bold,
//               letterSpacing: 1.2,
//               color: Colors.blueAccent),
//           duration: const Duration(milliseconds: 300),
//           child: const Text('Your Name'),
//         ),
//         AnimatedDefaultTextStyle(
//           style: Theme.of(context).textTheme.titleMedium!.copyWith(
//               fontWeight: FontWeight.w400,
//               color: Colors.grey[700],
//               fontStyle: FontStyle.italic),
//           duration: const Duration(milliseconds: 300),
//           child: const Text('Your Title or Tagline'),
//         ),
//       ],
//     );
//   }
// }

// // Expandable Information Card
// class InfoCard extends StatefulWidget {
//   final String title;
//   final String content;
//   final IconData icon;

//   const InfoCard(
//       {required this.title, required this.content, required this.icon});

//   @override
//   _InfoCardState createState() => _InfoCardState();
// }

// class _InfoCardState extends State<InfoCard>
//     with SingleTickerProviderStateMixin {
//   bool isExpanded = false;
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//   }

//   void _toggleExpand() {
//     setState(() {
//       isExpanded = !isExpanded;
//       if (isExpanded) {
//         _controller.forward();
//       } else {
//         _controller.reverse();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggleExpand,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         padding: const EdgeInsets.all(16.0),
//         margin: const EdgeInsets.only(bottom: 10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade300,
//               blurRadius: 10.0,
//               spreadRadius: 2.0,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(widget.icon, color: Colors.blueAccent),
//                 const SizedBox(width: 10),
//                 Text(widget.title,
//                     style: Theme.of(context).textTheme.titleLarge),
//               ],
//             ),
//             SizeTransition(
//               sizeFactor: _animation,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Text(widget.content),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Social Links with Animated Icons
// class SocialLinks extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _buildSocialIcon(Icons.work),
//         const SizedBox(width: 20),
//         _buildSocialIcon(Icons.code),
//       ],
//     );
//   }

//   Widget _buildSocialIcon(IconData icon) {
//     return GestureDetector(
//       onTap: () {
//         // Define action on icon tap
//       },
//       child: Icon(icon, color: Colors.blueAccent, size: 32),
//     );
//   }
// }
