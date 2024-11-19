import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets.dart';

class AnimatedProjectCard extends StatefulWidget {
  final String name;
  final String description;
  final String period;
  final int index;
  final List fullDescription;

  const AnimatedProjectCard(
      {super.key,
      required this.name,
      required this.description,
      required this.period,
      required this.index,
      required this.fullDescription});

  @override
  _AnimatedProjectCardState createState() => _AnimatedProjectCardState();
}

class _AnimatedProjectCardState extends State<AnimatedProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    Future.delayed(Duration(milliseconds: 200 * widget.index), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Card(
          elevation: 10,
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            // onTap: () => _showAnimatedDialog(context),
            onTap: () => _showProjectDetailsModal(context),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.folder, color: Apptheme.ogTeal, size: 28),
                      const SizedBox(width: 10),
                      AppFontText(
                        text: widget.name,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Apptheme.ogTeal,
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  // using Colors.grey[300], as its 300
                  Divider(color: Colors.grey[300]),
                  const SizedBox(height: 8),
                  AppFontText(
                    text: widget.description,
                    fontSize: 16,
                    color: Apptheme.black.withOpacity(0.7),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: AppFontText(
                      text: widget.period,
                      fontSize: 14,
                      color: Apptheme.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showProjectDetailsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: const Duration(milliseconds: 500),
      ),
      builder: (context) => ScaleTransition(
        scale: Tween<double>(begin: 0.9, end: 1.0).animate(
          CurvedAnimation(
            parent: ModalRoute.of(context)!.animation!,
            curve: Curves.easeOutBack,
          ),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.8,
          builder: (context, controller) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // using Colors because its using shades
                colors: [Colors.teal.shade100, Colors.teal.shade300],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              boxShadow: const [
                BoxShadow(
                  // using Colors as its taking black 26
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              children: [
                // Draggable handle
                Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    // using Colors as its taking 300 shade
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Project title with icon
                          Row(
                            children: [
                              Icon(Icons.folder,
                                  // using Colors as its using shade 700
                                  color: Colors.teal.shade700,
                                  size: 28),
                              const SizedBox(width: 10),
                              // used text widget because we are using shadow effect to the text
                              Text(
                                widget.name,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  // using Colors as its using shade 900
                                  color: Colors.teal.shade900,
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 2.0,
                                      // using Colors as its using shade 26
                                      color: Colors.black26,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Project description
                          AppFontText(
                            text: widget.description,
                            fontSize: 16,
                            color: Apptheme.black.withOpacity(0.7),
                          ),
                          const SizedBox(height: 16),
                          // Project period
                          Align(
                            alignment: Alignment.bottomRight,
                            child: AppFontText(
                              text: widget.period,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Apptheme.grey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Full description as bullet points
                          AppFontText(
                            text: "Responsibilities: ",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Apptheme.darkTeal,
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                widget.fullDescription.map<Widget>((item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppFontText(
                                      text: "• ",
                                      fontSize: 16,
                                      color: Apptheme.black.withOpacity(0.7),
                                    ),
                                    Expanded(
                                      child: AppFontText(
                                        text: item,
                                        fontSize: 16,
                                        color: Apptheme.black.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
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
