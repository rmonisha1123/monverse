import 'package:flutter/material.dart';
import 'package:monisha_portfolio/utils/constants.dart';
import 'package:monisha_portfolio/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          // Gradient Background with Wave Animation
          WaveBackground(),
          Column(
            children: [
              SizedBox(height: 60),
              ProfileHeader(),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // About Me Section
                      ProfileSection(
                        title: "About Me",
                        description:
                            "I’m an extrovert who enjoys building connections and cherishing moments with loved ones. I always strive for perfection in everything I do.",
                        icon: Icons.person,
                        gradientColors: [
                          Apptheme.softAmber,
                          Color.fromARGB(255, 156, 104, 40)
                        ],
                        // gradientColors: [
                        //   Colors.blueAccent,
                        //   Colors.purpleAccent
                        // ],
                      ),
                      // Family Section
                      ProfileSection(
                        title: "Family Background",
                        description:
                            "Living in a joint family of four, I am a single child with cherished responsibilities. My father runs a business, and my mother is a homemaker. Family is my constant source of strength and joy.",
                        icon: Icons.home,
                        gradientColors: [
                          Apptheme.paleAmber,
                          Color.fromARGB(255, 163, 128, 78)
                        ],
                        // gradientColors: [Colors.orangeAccent, Colors.redAccent],
                      ),
                      // Education Section
                      ProfileSection(
                        title: "Education",
                        description:
                            "Completed MCA (weekend program) at Anna University and BCA at M.O.P. Vaishnav College. These experiences have shaped my journey and growth.",
                        icon: Icons.school,
                        gradientColors: [
                          Apptheme.paleCoral,
                          Color.fromARGB(255, 113, 131, 130)
                        ],
                        // gradientColors: [Colors.greenAccent, Colors.tealAccent],
                      ),
                      // Hobbies Section
                      ProfileSection(
                        title: "Hobbies",
                        description:
                            "I enjoy making snacks, organizing spaces, going on adventures, and going on solo dates—just me and myself. I also love watching the Harry Potter movie series and the Friends series.",
                        icon: Icons.palette,
                        gradientColors: [
                          Apptheme.teal,
                          Color.fromARGB(255, 59, 116, 109)
                        ],
                        // gradientColors: [
                        //   Colors.yellowAccent,
                        //   Colors.amberAccent
                        // ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Header Section with Curved Design
class ProfileHeader extends StatelessWidget {
  const ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppFontText(
          text: "Welcome to My Profile",
          fontWeight: FontWeight.bold,
          color: Apptheme.black,
          fontSize: 20,
        ),
        const SizedBox(height: 10),
        AppFontText(
          text: "Get to know me better",
          fontWeight: FontWeight.w400,
          color: Apptheme.black.withOpacity(0.6),
        )
      ],
    );
  }
}

// Profile Section with Curved and Flowing Design
class ProfileSection extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final List<Color> gradientColors;

  const ProfileSection({
    required this.title,
    required this.description,
    required this.icon,
    required this.gradientColors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 50, color: Colors.white),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFontText(
                  text: title,
                  color: Apptheme.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                const SizedBox(height: 10),
                AppFontText(
                  text: description,
                  color: Apptheme.black,
                  fontSize: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Animated Wave Background
class WaveBackground extends StatelessWidget {
  const WaveBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey],
          // colors: [Apptheme.darkBlue, Apptheme.darkBlueGradient],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}

// Wave Animation for Background
class AnimatedWave extends StatefulWidget {
  const AnimatedWave();

  @override
  _AnimatedWaveState createState() => _AnimatedWaveState();
}

class _AnimatedWaveState extends State<AnimatedWave>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ClipPath(
          clipper: WaveClipper(_controller.value),
          child: Container(
            color: Colors.white.withOpacity(0.3),
          ),
        );
      },
    );
  }
}

// Custom Wave Clipper
class WaveClipper extends CustomClipper<Path> {
  final double waveStrength;

  WaveClipper(this.waveStrength);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    final waveHeight = size.height * 0.3 * waveStrength;
    path.quadraticBezierTo(size.width * 0.25, size.height - waveHeight,
        size.width * 0.5, size.height);
    path.quadraticBezierTo(
        size.width * 0.75, size.height + waveHeight, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
