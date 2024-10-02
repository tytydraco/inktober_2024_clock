import 'package:flutter/material.dart';
import 'package:template/src/models/line.dart';
import 'package:template/src/text_bar.dart';
import 'package:template/src/wisdom.dart';

/// The home screen.
class HomeScreen extends StatefulWidget {
  /// Creates a new [HomeScreen].
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _lines = <Line>[
    Line(content: 'hello', speaker: Speaker.cronos),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Wisdom(lines: _lines),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextBar(
              onSubmit: (input) => setState(() {
                _lines.add(Line(
                  content: input,
                  speaker: Speaker.player,
                ));
              }),
            ),
          ),
        ],
      ),
    );
  }
}
