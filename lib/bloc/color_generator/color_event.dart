part of 'color_bloc.dart';

/// base ancestor for all event types
abstract class ColorEvent {}

/// request to reset to [InitialColorState]
class ResetToDefaultColorEvent extends ColorEvent {}

/// request to change to [NewColorState]
class GenerateRandomColorEvent extends ColorEvent {}
