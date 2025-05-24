import 'package:flutter/material.dart';

class PressableButton extends StatefulWidget {
  const PressableButton({super.key});

  @override
  State<PressableButton> createState() => _PressableButtonState();
}

class _PressableButtonState extends State<PressableButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _shadowOffsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _shadowOffsetAnimation = Tween<Offset>(
      begin: const Offset(8.0, 8.0),
      end: const Offset(4.0, 12.0), // Shadow moves down more when pressed
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 500,
        // color: Colors.pink,
        alignment: Alignment.center,
        child: GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: () => _controller.reverse(),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  // Shadow Container
                  Transform.translate(
                    offset: _shadowOffsetAnimation.value,
                    child: Transform.scale(
                      scale: 1 -
                          (0.04 *
                              _controller
                                  .value), // Slightly reduce shadow size when pressed
                      child: Opacity(
                        opacity: 1 -
                            (0.2 *
                                _controller
                                    .value), // Slightly fade shadow when pressed
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Main Button Container
                  Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.1 * (1 - _controller.value)),
                            blurRadius: 5,
                            offset: Offset(0, 2 * (1 + _controller.value)),
                          ),
                        ],
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
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class StaticButtonDemo extends StatelessWidget {
  const StaticButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400, // Height of the pink background container
        width: 500, // Width of the pink background container
        color: Colors.pink, // Background container color
        alignment:
            Alignment.center, // Center the Stack within the pink container
        child: Stack(
          alignment:
              Alignment.center, // Align children to the center of the Stack
          children: [
            // Shadow Container (Black, slightly larger and offset)
            Transform.translate(
              offset: const Offset(
                  8.0, 8.0), // Offset shadow 8px right and 8px down
              child: Container(
                height: 100, // Same height as main button
                width: 200, // Same width as main button
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.3), // Translucent for shadow effect
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ),
            // Main Button Container (Amber)
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
        ),
      ),
    );
  }
}
