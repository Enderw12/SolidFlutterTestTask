import 'dart:math';
import 'dart:ui';

/// [RandomColorGenerator] provides tools for generation of random colors
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
