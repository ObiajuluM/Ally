import 'package:ally/misc/page_transition_animations.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),

    /// text font
    fontFamily: 'VarelaRound',

    /// scaffold background color
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),

    ///
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.black,
    ),

    /// for the animation when switching to and from pages
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
        TargetPlatform.iOS: FadePageTransitionsBuilder(),
      },
    )

    ///
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: Colors.grey[100], // Light grey background for text fields
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8.0),
    //     borderSide: BorderSide.none, // No border by default
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8.0),
    //     borderSide: BorderSide.none,
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8.0),
    //     borderSide: const BorderSide(color: Colors.blue), // Blue border on focus
    //   ),
    //   hintStyle: TextStyle(color: Colors.grey[600]),
    //   contentPadding:
    //       const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    // ),
    );
