class HighScores {
  final List<int> scores;

  HighScores(this.scores);
  
  int latest() {
    return scores.last;
  }

  int personalBest() {
    return scores.reduce((curr, next) => curr > next ? curr : next);
  }

  List<int> personalTopThree() {
    List<int> sortedScores = List.from(scores);
    sortedScores.sort((a, b) => b.compareTo(a));
    return sortedScores.take(3).toList();
  }
}
