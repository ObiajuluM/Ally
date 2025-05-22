import 'package:flutter/material.dart';

class BackpageInk extends StatelessWidget {
  /// The stateless widget that displays a sparkling Ink effect when tapped, used for background or empty space interactions.
  const BackpageInk({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      splashFactory: InkSparkle.splashFactory,
      onTap: () {
        print("inked");
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    );
  }
}
