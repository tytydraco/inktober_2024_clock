import 'package:flutter/material.dart';
import 'package:template/src/home_screen.dart';
import 'package:template/src/themes.dart';

void main() {
  runApp(const Clock());
}

/// Clock app for Inktober 2024.
class Clock extends StatelessWidget {
  /// Creates a new [Clock].
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock [Inktober 2024]',
      theme: primaryTheme,
      darkTheme: primaryTheme,
      home: const HomeScreen(),
    );
  }
}
