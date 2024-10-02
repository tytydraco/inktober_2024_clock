import 'package:flutter/material.dart';
import 'package:template/src/line_widget.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(scrollbars: false),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final line = widget.lines[index];
          return LineWidget(line: line);
        },
        itemCount: widget.lines.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
