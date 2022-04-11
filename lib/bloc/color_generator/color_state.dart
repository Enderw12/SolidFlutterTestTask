part of 'color_bloc.dart';

/// background color
abstract class ColorState {
  /// background color
  Color get color;
}

/// default color is blue
class InitialColorState extends ColorState with ColorValueToString {
  /// default color is blue
  @override
  Color get color => defaultColor;

  @override
  String toString() {
    return color.value.toString();
  }
}

/// contains new [color]
/// [color] is usually randomly generated with [RandomColorGenerator] util
class NewColorState extends ColorState with ColorValueToString {
  @override
  final Color color;

  ///
  NewColorState(this.color);
}

/// override toString method to return Color.value
mixin ColorValueToString on ColorState {
  @override
  String toString() {
    return color.value.toString();
  }
}
