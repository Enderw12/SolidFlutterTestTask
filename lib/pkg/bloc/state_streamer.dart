import 'package:flutter_solid_tamplate/pkg/bloc/streamer.dart';

/// provides synchronous getter for streamed object of type [State]
abstract class StateStreamer<State> extends Streamer<State> {
  /// latest emitted [state] of type [State]
  State get state;
}
