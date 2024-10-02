import 'package:flutter/material.dart';
import 'package:inktober_2024_clock/src/models/line.dart';

/// Widget for [Line].
class LineWidget extends StatefulWidget {
  /// Creates a new [LineWidget].
  const LineWidget({
    required this.line,
    super.key,
  });

  /// The [Line] to use.
  final Line line;

  @override
  State<LineWidget> createState() => _LineWidgetState();
}

class _LineWidgetState extends State<LineWidget> {
  double _lineOpacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _lineOpacity = 1;
      });
    });
  }

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
        fontSize: 26,
        fontFamily: 'monospace',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _lineOpacity,
      duration: const Duration(milliseconds: 500),
      child: _makeLine(widget.line),
    );
  }
}
