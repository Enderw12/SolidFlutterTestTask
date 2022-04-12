part of 'color_bloc.dart';

/// base interface for every ColorBloc state-type
abstract class ColorState {
  /// background color (according to test task)
  Color get color;
}

/// default color is [defaultColor]
class InitialColorState extends ColorState with ColorValueToString {
  /// default color is [defaultColor]
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

  /// nothing to explain here i guess
  NewColorState(this.color);
}

/// override toString method to return Color.value
mixin ColorValueToString on ColorState {
  @override
  String toString() {
    return color.value.toString();
  }
}
