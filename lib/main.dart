import 'package:flutter/material.dart';
import 'package:template/src/screens/chat_screen.dart';
import 'package:template/src/themes.dart';

void main() {
  runApp(const ClockInktober2024());
}

/// Clock app for Inktober 2024.
class ClockInktober2024 extends StatelessWidget {
  /// Creates a new [ClockInktober2024].
  const ClockInktober2024({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock [Inktober 2024]',
      theme: primaryTheme,
      darkTheme: primaryTheme,
      home: const ChatScreen(),
    );
  }
}
