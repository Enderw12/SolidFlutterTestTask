import 'package:flutter/material.dart';
import 'package:flutter_solid_tamplate/bloc/color_generator/color_bloc.dart';
import 'package:flutter_solid_tamplate/pkg/bloc/widgets/bloc_builder.dart';
import 'package:flutter_solid_tamplate/ui/home/widgets/generate_random_color_button.dart';
import 'package:flutter_solid_tamplate/ui/home/widgets/reset_to_default_color_button.dart';

/// default screen of our application
@Deprecated("unneeded according to test task")
class HomeScreen extends StatelessWidget {
  /// value required for named routes
  static const String id = '/home_screen';

  /// default home screen widget constructor (no dependencies required)
  @Deprecated("unneeded according to test task")
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      // hardcoded White color improves visibility of transparent colors
      color: Colors.white,
      child: BlocBuilder<ColorBloc, ColorState>(
        builder: (context, state) {
          return Container(
            color: state.color,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  GenerateRandomColorButton(),
                  SizedBox(
                    height: 32,
                  ),
                  ResetToDefaultColorButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
