import 'package:template/src/wisdom.dart';

/// Who is speaking a [Line].
enum Speaker {
  /// Cronos.
  cronos,

  /// The player.
  player,
}

/// A line of [Wisdom].
class Line {
  /// Creates a new [Line] given some [content] and a [speaker].
  Line({
    required this.content,
    required this.speaker,
  });

  /// The content.
  final String content;

  /// The speaker.
  final Speaker speaker;
}
