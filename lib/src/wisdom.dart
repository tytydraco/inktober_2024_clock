import 'package:flutter/material.dart';
import 'package:template/src/models/line.dart';

/// The text output.
class Wisdom extends StatefulWidget {
  /// Creates a new [Wisdom].
  const Wisdom({
    required this.lines,
    super.key,
  });

  /// Lines to display.
  final List<Line> lines;

  @override
  State<Wisdom> createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  Widget _makeLine(Line line) {
    Color color;
    TextAlign textAlign;

    if (line.speaker == Speaker.cronos) {
      color = Colors.orange;
      textAlign = TextAlign.start;
    } else {
      color = Colors.grey;
      textAlign = TextAlign.end;
    }

    return Text(
      line.content,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: 32,
        fontFamily: 'monospace',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(scrollbars: false),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final line = widget.lines[index];
          return _makeLine(line);
        },
        itemCount: widget.lines.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
