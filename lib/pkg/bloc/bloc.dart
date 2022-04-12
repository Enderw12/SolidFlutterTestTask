import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_solid_tamplate/pkg/bloc/state_streamer.dart';

/// basic implementation of a stream based state management tool
/// inspired by https://github.com/felangel/bloc
class Bloc<Event, State> extends StateStreamer<State> with Sink<Event> {
  StreamController<State>? _stateStreamController;
  StreamController<Event>? _eventStreamController;

  final List<_Handler> _handlers = [];

  final List<StreamSubscription> _subscriptions = [];

  /// last emitted state is non nullable
  /// because initial state value is required in default constructor)
  State _state;

  StreamController<Event> get _eventSC {
    return _eventStreamController ??= StreamController<Event>.broadcast();
  }

  StreamController<State> get _stateSC {
    return _stateStreamController ??= StreamController<State>.broadcast();
  }

  /// [State] stream
  @override
  Stream<State> get stream {
    return _stateSC.stream;
  }

  Stream<Event> get _events {
    return _eventSC.stream;
  }

  /// latest emitted state
  @override
  State get state {
    return _state;
  }

  /// required to provide initial state value
  @mustCallSuper
  Bloc(this._state);

  /// use this to add event handlers of exact type [E]
  void on<E extends Event>(
    _EventHandler<E, State> _eventHandler,
  ) {
    if (_handlers.any((handler) => handler.type == E)) {
      final message =
          'handler of type ${_eventHandler.runtimeType} already added to bloc $runtimeType';
      Error.throwWithStackTrace(Exception(message), StackTrace.current);
    }

    final stream = _events.where((e) => e is E).cast<E>();
    final handledStream = stream.map((event) => _eventHandler(event, _emit));
    final subscription = handledStream.listen(null);
    _subscriptions.add(subscription);
  }

  /// adds new event to be handled
  @override
  void add(Event event) {
    _eventSC.add(event);
  }

  /// emits new unique state
  /// must not be called explicitly
  /// ignores repeating states
  void _emit(State state) {
    // ignores identical repeating states
    if (_state == state) return;
    _state = state;
    _addState(state);
  }

  /// must not be called explicitly
  void _addState(State state) {
    _stateSC.add(state);
  }

  /// must call to avoid memory leaks
  @mustCallSuper
  @override
  void close() {
    _stateStreamController?.close();
    _eventStreamController?.close();
    _subscriptions.forEach(_cancelStreamSubscription);
  }

  void _cancelStreamSubscription(StreamSubscription subscription) {
    subscription.cancel();
  }
}

typedef _EventHandler<E, State> = FutureOr<void> Function(
  E event,
  void Function(State state) emit,
);

class _Handler {
  final Type type;
  const _Handler(this.type);
}
