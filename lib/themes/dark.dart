import 'package:ally/misc/page_transition_animations.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
    brightness: Brightness.dark,
  ),

  /// text font
  fontFamily: 'VarelaRound',

  /// scaffold background color
  scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),

  ///
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    surfaceTintColor: Colors.white,
  ),

  /// for the animation when switching to and from pages
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
      TargetPlatform.iOS: FadePageTransitionsBuilder(),
    },
  ),
);
