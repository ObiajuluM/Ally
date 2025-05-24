import 'dart:developer';
import 'package:flutter/material.dart';

class PressableButtonAnimated extends StatefulWidget {
  // Use a builder function to pass the 'isPressed' state to the child
  final Widget Function(bool isPressed) builder;
  final VoidCallback onPressed;
  final Duration animationDuration;
  final double scaleFactor;
  final double pressedOffset; // Fractional vertical offset for AnimatedSlide

  const PressableButtonAnimated({
    super.key,
    required this.builder,
    required this.onPressed,
    this.animationDuration = const Duration(milliseconds: 100),
    this.scaleFactor = 0.95,
    this.pressedOffset = 0.05, // Default fractional offset (e.g., 5% of height)
  });

  @override
  _PressableButtonAnimatedState createState() =>
      _PressableButtonAnimatedState();
}

class _PressableButtonAnimatedState extends State<PressableButtonAnimated> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final double overallScale = _isPressed ? widget.scaleFactor : 1.0;
    // overallYOffset is used by AnimatedSlide as a fraction of the child's size
    final double overallYOffset = _isPressed ? widget.pressedOffset : 0.0;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedScale(
        scale: overallScale,
        duration: widget.animationDuration,
        curve: Curves.easeOutCubic,
        child: AnimatedSlide(
          offset: Offset(
              0, overallYOffset), // Vertical translation as a fraction of size
          duration: widget.animationDuration,
          curve: Curves.easeOutCubic,
          child: widget.builder(_isPressed), // Pass _isPressed to the builder
        ),
      ),
    );
  }
}

class BigRedButton extends StatelessWidget {
  const BigRedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double buttonSize = 250.0; // Diameter of the circle
    const double shadowOffsetValue =
        6.0; // How far the shadow is initially offset

    return Center(
      child: PressableButtonAnimated(
        pressedOffset: 0.05, // Button moves down by 5% of its height
        scaleFactor: 0.93, // Scales down a bit more for a circular button
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Big Red Button Clicked!')),
          );
          print('Big Red Button pressed!');
          log("BOOOOOOOOOOOOOOOBS");
        },
        builder: (bool isPressed) {
          final double currentShadowOffsetX = isPressed ? 0 : shadowOffsetValue;
          final double currentShadowOffsetY = isPressed ? 0 : shadowOffsetValue;
          final double shadowOpacity =
              isPressed ? 0.15 : 0.5; // Adjusted opacity

          return SizedBox(
            //SizedBox to constrain the Stack size
            width: buttonSize + shadowOffsetValue, // Accommodate shadow offset
            height: buttonSize + shadowOffsetValue,
            child: Stack(
              alignment:
                  Alignment.center, // Center children within the SizedBox
              children: [
                /// Animated Shadow Container
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeOutCubic,
                  // Position the shadow based on its offset
                  left: isPressed ? shadowOffsetValue / 2 : 0,
                  top: isPressed ? shadowOffsetValue / 2 : 0,
                  child: Transform.translate(
                    offset: Offset(currentShadowOffsetX, currentShadowOffsetY),
                    child: AnimatedOpacity(
                      opacity: shadowOpacity,
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                        height: buttonSize,
                        width: buttonSize,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),

                /// Main Button Container (Red, circular, on top)
                Container(
                  height: buttonSize,
                  width: buttonSize,
                  decoration: BoxDecoration(
                    color: Colors.red, // Main button color
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black26, // Darker border for definition
                      width: 3,
                    ),
                    boxShadow: [
                      // Adding a subtle inner shadow for depth if not pressed
                      if (!isPressed)
                        BoxShadow(
                          color: Colors.red.shade800.withOpacity(0.7),
                          offset: const Offset(2, 2),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      if (!isPressed)
                        BoxShadow(
                          color: Colors.red.shade300.withOpacity(0.5),
                          offset: const Offset(-1, -1),
                          blurRadius: 2,
                          spreadRadius: 0.5,
                        )
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'SOS', // Changed text for a circular button
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36, // Adjusted font size
                        shadows: [
                          // Text shadow for better readability
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
