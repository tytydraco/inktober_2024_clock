import 'package:flutter/material.dart';
import 'package:template/src/models/line.dart';
import 'package:template/src/widgets/text_bar_widget.dart';
import 'package:template/src/widgets/wisdom_widget.dart';

/// The chat screen.
class ChatScreen extends StatefulWidget {
  /// Creates a new [ChatScreen].
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _lines = <Line>[];

  Future<void> _onPlayerSpeaks(String input) async {
    // Append our own text to the chat.
    _lines.add(
      Line(
        content: input,
        speaker: Speaker.player,
      ),
    );

    // Handle the actual input.
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
