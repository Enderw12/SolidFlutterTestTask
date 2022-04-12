import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_solid_tamplate/pkg/bloc/state_streamer.dart';
import 'package:provider/provider.dart';

/// builder widget similar to [StreamBuilder]
class BlocBuilder<B extends StateStreamer<S>, S> extends StatefulWidget {
  /// builder method similar to builder of [StreamBuilder]
  final Widget Function(BuildContext context, S state) builder;

  /// reactive builder
  /// which requires a bloc of type [B] injected with [Provider] before usage
  const BlocBuilder({
    required this.builder,
  });

  @override
  _BlocBuilderState createState() => _BlocBuilderState<B, S>();
}

class _BlocBuilderState<B extends StateStreamer<S>, S>
    extends State<BlocBuilder<B, S>> {
  StreamSubscription? subscription;

  B get _bloc => context.read<B>();
  S get _state => _bloc.state;

  @override
  void initState() {
    subscription = _bloc.stream.listen((state) {
      setState(() {
        // TODO: remove during next refactoring cycle
        log('New state arrived with value == $state');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _state);
  }

  @override
  void dispose() {
    _unsubscribe();
    super.dispose();
  }

  void _unsubscribe() {
    subscription?.cancel();
    subscription = null;
  }
}
