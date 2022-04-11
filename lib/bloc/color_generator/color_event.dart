part of 'color_bloc.dart';

/// meaningless ancestor for all events =)
abstract class ColorEvent {}

/// request to reset to [InitialColorState]
class ResetToDefaultColorEvent extends ColorEvent {}

/// request to change to [NewColorState]
class GenerateRandomColorEvent extends ColorEvent {}
