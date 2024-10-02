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
  final _scrollController = ScrollController();

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollDown());

    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(scrollbars: false),
      child: ListView.builder(
        controller: _scrollController,
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
