/// The logic for Cronus.
class Cronus {
  /*
    - Parents: Uranus and Gaea
    - Sister: Rhea
    - Overthrew father
    - Overthrown by Zeus
    - Holds harpe, scythe, sickle */

  /// Valid names for [Cronus].
  final names = [
    'Cronos',
    'Cronus',
    'Kronos',
  ];

  /// The opening dialogue from [Cronus].
  final initialDialogue = 'I was born from the earth and the sky';

  /// Map of key phrases to future dialogues.
  final responses = {
    'earth': 'My mother.',
    'sky':
        'My father, who hid my brother such that he would not see the light.',
    'brother': 'An abomination powerful enough to overthrow the sky.',
    'abomination': 'Ginormous, in appearance and in strength.',
    'light': 'Hidden nine days below earth, a place of no escape.',
    'strength':
        'Though I am not strong like my brothers, I hold a strong tool.',
    'tool': 'A sickle, given to me by the earth.',
    'sickle': 'To castrate the sky.',
    'castrate': "My mother's vengeance of my father by me.",
    'me': 'I am the ruler of gods, destined to the same fate as my father.',
    'fate': 'My children will take me, lest I take.',
    'take': 'I consume my children, but one.',
    'one': 'A plot to replace my son with a stone.',
    'stone': 'Who I believed to be Zeus.',
    'zeus': 'Imprisoned by my own son in Tartarus.',
  };

// TODO: auto-bracket phrases
}
