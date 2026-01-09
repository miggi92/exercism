class SpaceAge {
  static const double earthYearInSeconds = 31557600.0;

  final Map<String, double> planetRatios = {
    'Mercury': 0.2408467,
    'Venus': 0.61519726,
    'Earth': 1.0,
    'Mars': 1.8808158,
    'Jupiter': 11.862615,
    'Saturn': 29.447498,
    'Uranus': 84.016846,
    'Neptune': 164.79132,
  };

  double age({required String planet, required int seconds}) {
    if (!planetRatios.containsKey(planet)) {
      throw ArgumentError("Planet $planet is not in the Solar System list.");
    }
    double ageOnPlanet = seconds / (earthYearInSeconds * planetRatios[planet]!);
    return double.parse(ageOnPlanet.toStringAsFixed(2));
  }
}
