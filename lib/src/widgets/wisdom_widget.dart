import 'package:flutter/material.dart';
import 'package:template/src/models/line.dart';
import 'package:template/src/widgets/line_widget.dart';

/// The text output.
class WisdomWidget extends StatefulWidget {
  /// Creates a new [WisdomWidget].
  const WisdomWidget({
    required this.lines,
    super.key,
  });

  /// Lines to display.
  final List<Line> lines;

  @override
  State<WisdomWidget> createState() => _WisdomWidgetState();
}

class _WisdomWidgetState extends State<WisdomWidget> {
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
