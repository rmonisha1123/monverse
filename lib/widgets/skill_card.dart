import 'package:flutter/material.dart';
import 'package:monisha_portfolio/widgets.dart';

class SkillCard extends StatefulWidget {
  final String imagePath;
  final String skill;

  SkillCard({required this.imagePath, required this.skill});

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isTapped = false;

  void _onTap(bool tapped) {
    setState(() {
      _isTapped = tapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _onTap(true),
      onTapUp: (_) => _onTap(false),
      onTapCancel: () => _onTap(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: _isTapped ? Matrix4.identity() : Matrix4.identity()
          ..scale(1.0),
        child: Card(
          elevation: _isTapped ? 12 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _isTapped ? 60 : 50,
                  width: _isTapped ? 60 : 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _isTapped ? 1.0 : 0.0,
                  child: AppFontText(
                    text: widget.skill,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
