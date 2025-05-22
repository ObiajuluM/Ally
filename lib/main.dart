import 'dart:io';

import 'package:ally/pages/home/home.dart';
import 'package:ally/pages/primary/primary.dart';
import 'package:ally/themes/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  // set high refresh rate for android, add an option to drop this to the lowest
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

// todo: add predicitve back for android here and the fade for ios
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: lightTheme,
      home: PrimaryPage(),
    );
  }
}
