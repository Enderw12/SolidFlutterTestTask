import 'dart:math';
import 'dart:ui';

/// My name is RandomColorGenerator. After five years on a hellish island,
/// I have come home with only one goal … to implement [randomColor] feature.
/// https://en.wikipedia.org/wiki/Arrow_(TV_series)
/// Season 2 intro monologue by Oliver Queen
class RandomColorGenerator {
  /// generate new random [Color] object
  static Color get randomColor {
    final r = Random().nextInt(255);
    final g = Random().nextInt(255);
    final b = Random().nextInt(255);
    final opacity = Random().nextDouble();
    final randomColor = Color.fromRGBO(r, g, b, opacity);

    return randomColor;
  }
}
