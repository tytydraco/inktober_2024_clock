import 'package:flutter/material.dart';
import 'package:inktober_2024_clock/src/models/line.dart';
import 'package:inktober_2024_clock/src/util/cronus.dart';
import 'package:inktober_2024_clock/src/widgets/text_bar_widget.dart';
import 'package:inktober_2024_clock/src/widgets/wisdom_widget.dart';

/// The chat screen.
class ChatScreen extends StatefulWidget {
  /// Creates a new [ChatScreen].
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _cronus = Cronus();
  final _lines = <Line>[];

  @override
  void initState() {
    super.initState();

    // Start with the initial prompt.
    setState(() {
      _lines.add(
        Line(
          content: _cronus.speak(),
          speaker: Speaker.cronos,
        ),
      );
    });
  }

  Future<void> _onPlayerSpeaks(String input) async {
    // Append our own text to the chat.
    setState(() {
      _lines.add(
        Line(
          content: input,
          speaker: Speaker.player,
        ),
      );
    });

    await Future<void>.delayed(const Duration(seconds: 1));

    // Handle the actual input.
    final response = _cronus.speak(input);
    setState(() {
      _lines.add(
        Line(
          content: response,
          speaker: Speaker.cronos,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: WisdomWidget(lines: _lines)),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextBarWidget(
              onSubmit: _onPlayerSpeaks,
            ),
          ),
        ],
      ),
    );
  }
}
