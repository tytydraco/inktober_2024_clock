/// The logic for Cronus.
class Cronus {
  /// Valid names for [Cronus].
  final _names = [
    'cronos',
    'cronus',
    'kronos',
  ];

  /// The opening dialogue from [Cronus].
  final _initialDialogue =
      'I was born from the earth and the sky. What is my name?';

  /// Map of key phrases to future dialogues.
  late final _responses = {
    'help': _initialDialogue,
    // Mythology.
    'earth': 'My mother, the savior of my brother.',
    'sky':
        'My father, who hid my brother such that he would not see the light.',
    'brother': 'An abomination powerful enough to overthrow the sky.',
    'abomination': 'Ginormous, in appearance and in strength.',
    'ginormous': 'A threat to my father.',
    'light': 'Hidden nine days below earth, a place of no escape.',
    'strength':
        'Though I am not strong like my brothers, I hold a strong tool.',
    'tool': 'A sickle, given to me by the earth.',
    'sickle': 'To castrate the sky.',
    'castrate': "My mother's vengeance of my father by me.",
    'me': 'I am the ruler of gods, destined to the same fate as my father.',
    'fate': 'My children will take me, lest I take them.',
    'take': 'I consume my children, but one.',
    'one': 'A plot to replace my son with a stone.',
    'stone': 'Who I believed to be Zeus.',
    'zeus': 'I was imprisoned by my own son in Tartarus.',
    'tartarus': 'The place my father first hid my brother, now my prison.',
    'prison': 'For all eternity.',
    // Clocks and time.
    'name': 'There is no mortal unaffected by my passage.',
    'passage': 'Now, then, earlier, before, after, soon, later.',
    'mortal': 'Only the living fear my consequences.',
    'consequences': 'Natural death.',
    'fear':
        'My name represent many forms: an hourglass, a clock, an ouroboros.',
    'hourglass': 'I am finite and irreversible.',
    'clock': 'The root of my name.',
    'ouroboros': 'Rebirth and renewal.',
  };

  /// Highlights all keywords in the [phrase].
  String highlight(String phrase) {
    final keywords = _responses.keys.toSet();

    final pattern = '\\b(${keywords.join('|')})\\b';
    final regex = RegExp(pattern, caseSensitive: false);
    final result = phrase.replaceAllMapped(regex, (match) => '[${match[0]}]');

    return result;
  }

  /// Communicate with [Cronus].
  String speak([String? input]) {
    final cleanInput = input?.toLowerCase();

    if (cleanInput == null) return highlight(_initialDialogue);
    if (_names.contains(cleanInput)) return 'Congratulations!';
    if (_responses.keys.contains(cleanInput)) {
      return highlight(_responses[cleanInput]!);
    }

    return '?';
  }
}
