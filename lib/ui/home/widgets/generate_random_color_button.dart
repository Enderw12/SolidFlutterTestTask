import 'package:flutter/material.dart';
import 'package:flutter_solid_tamplate/bloc/color_generator/color_bloc.dart';
import 'package:provider/provider.dart';

/// triggers [GenerateRandomColorEvent]
class GenerateRandomColorButton extends StatelessWidget {
  /// new [GenerateRandomColorButton] widget
  const GenerateRandomColorButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Provider.of<ColorBloc>(context, listen: false).add(
        GenerateRandomColorEvent(),
      ),
      child: Text(
        'GenerateRandomColor',
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
