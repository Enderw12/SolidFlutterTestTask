import 'package:flutter/material.dart';
import 'package:flutter_solid_tamplate/bloc/color_generator/color_bloc.dart';
import 'package:provider/provider.dart';

/// triggers [ResetToDefaultColorEvent]
class ResetToDefaultColorButton extends StatelessWidget {
  /// new [ResetToDefaultColorButton] widget
  const ResetToDefaultColorButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Provider.of<ColorBloc>(context, listen: false).add(
        ResetToDefaultColorEvent(),
      ),
      child: Text(
        'ResetToDefaultColor',
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
