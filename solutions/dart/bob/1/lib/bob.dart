class Bob {
  String response(String text) {
    final input = text.trim();

    if (input.isEmpty) {
      return "Fine. Be that way!";
    }

    final hasLetters = input.contains(RegExp(r'[a-zA-Z]'));
    final isYelling = hasLetters && input == input.toUpperCase();

    final isQuestion = input.endsWith('?');

    if (isYelling && isQuestion) {
      return "Calm down, I know what I'm doing!";
    } else if (isYelling) {
      return "Whoa, chill out!";
    } else if (isQuestion) {
      return "Sure.";
    }

    return "Whatever.";
  }
}
