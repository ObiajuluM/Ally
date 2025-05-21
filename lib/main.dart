import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.blue,
            child: Text(
              'Welcome to Safety Ally',
              
              style: GoogleFonts.varelaRound(
                fontSize: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
