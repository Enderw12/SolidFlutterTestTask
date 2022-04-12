import 'package:flutter/material.dart';
import 'package:flutter_solid_tamplate/bloc/color_generator/color_bloc.dart';
import 'package:flutter_solid_tamplate/pkg/bloc/widgets/bloc_builder.dart';
import 'package:provider/provider.dart';

/// main screen required according to test task.
///
class HelloScreen extends StatelessWidget {
  /// value required for named routes
  static const id = '/hello_screen';

  /// default hello screen widget constructor (no dependencies required)
  const HelloScreen({Key? key}) : super(key: key);

  void _generateNewColor(BuildContext context) {
    Provider.of<ColorBloc>(context, listen: false).add(
      GenerateRandomColorEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _generateNewColor(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ColorBloc, ColorState>(
          builder: (context, state) {
            return ColoredBox(
              color: state.color,
              child: Center(
                child: Text(
                  "Hey there",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
