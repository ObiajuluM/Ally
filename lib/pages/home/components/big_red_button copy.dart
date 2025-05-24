import 'package:flutter/material.dart';

class PressableButtonAnimated extends StatefulWidget {
  // Use a builder function to pass the 'isPressed' state to the child
  final Widget Function(bool isPressed) builder;
  final VoidCallback onPressed;
  final Duration animationDuration;
  final double scaleFactor;
  final double pressedOffset; // Overall vertical offset when pressed

  const PressableButtonAnimated({
    Key? key,
    required this.builder,
    required this.onPressed,
    this.animationDuration = const Duration(milliseconds: 100),
    this.scaleFactor =
        0.95, // Slightly more pronounced scale down for this effect
    this.pressedOffset = 4.0, // Overall button moves down by 4 pixels
  }) : super(key: key);

  @override
  _PressableButtonAnimatedState createState() =>
      _PressableButtonAnimatedState();
}

class _PressableButtonAnimatedState extends State<PressableButtonAnimated> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final double overallScale = _isPressed ? widget.scaleFactor : 1.0;
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
        // Execute callback after the release animation starts/completes
        // You might want to delay this if the animation is long
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
          offset: Offset(0, overallYOffset), // Overall vertical translation
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
    return Center(
      child: PressableButtonAnimated(
        pressedOffset: 0.2,

        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Amber button clicked!')),
          );
          print('Amber button pressed!');
        },
        // The builder provides the isPressed state to its child
        builder: (bool isPressed) {
          // Adjust shadow properties based on 'isPressed'
          final double shadowOffsetX =
              isPressed ? 0 : 6.0; // Shadow shifts closer when pressed
          final double shadowOffsetY =
              isPressed ? 0 : 6.0; // Shadow shifts closer when pressed
          final double shadowOpacity =
              isPressed ? 0.2 : 1; // Shadow becomes lighter/more transparent

          return Stack(
            // We don't need a specific alignment here if children are positioned
            // or if the main button is centered and shadow offset by Transform.translate
            children: [
              /// Animated Shadow Container (Black, behind the main button)
              // This uses Transform.translate for the offset, which is also animated
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeOutCubic,
                left: 0, right: 0, top: 0,
                bottom: 0, // Fill stack area
                child: Transform.translate(
                  offset: Offset(shadowOffsetX, shadowOffsetY),
                  child: AnimatedOpacity(
                    opacity: shadowOpacity,
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                      height: 100, // Match main button's effective size
                      width: 200, // Match main button's effective size
                      decoration: BoxDecoration(
                        color: Colors.black, // Base color is black
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                  ),
                ),
              ),

              /// Main Button Container (Amber, on top)
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.amber, // Main button color
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2, // Border width
                  ),
                  borderRadius: BorderRadius.circular(60), // Rounded corners
                ),
                child: const Center(
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
