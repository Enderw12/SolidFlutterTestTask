import 'package:flutter/material.dart';
import 'package:flutter_solid_tamplate/constants/colors.dart';
import 'package:flutter_solid_tamplate/pkg/bloc/bloc.dart';
import 'package:flutter_solid_tamplate/utils/random_color_generator.dart';

part 'color_event.dart';
part 'color_state.dart';

/// controller with one goal - provide [ColorState] on demand
/// available events: [ResetToDefaultColorEvent], [GenerateRandomColorEvent]
class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ///
  ColorBloc() : super(InitialColorState()) {
    on<ResetToDefaultColorEvent>(_resetToDefaultColorEventHandler);
    on<GenerateRandomColorEvent>(_generateRandomColorEventHandler);
  }

  void _resetToDefaultColorEventHandler(
    ResetToDefaultColorEvent _,
    void Function(ColorState) emit,
  ) {
    emit(InitialColorState());
  }

  void _generateRandomColorEventHandler(
    GenerateRandomColorEvent _,
    void Function(ColorState) emit,
  ) {
    final newRandomColor = RandomColorGenerator.randomColor;
    final newColorState = NewColorState(newRandomColor);
    emit(newColorState);
  }
}
