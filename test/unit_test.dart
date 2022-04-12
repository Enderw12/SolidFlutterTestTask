import 'package:flutter_solid_tamplate/bloc/color_generator/color_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    "ColorBloc tests",
    () {
      late ColorBloc colorBloc;

      setUp(() => colorBloc = ColorBloc());

      tearDown(() {
        colorBloc.close();
      });

      test(
        'expect new ColorBloc.state to be type InitialColorState ',
        () {
          expect(
            colorBloc.state is InitialColorState,
            isTrue,
          );
        },
      );

      test(
        'must emit NewColorState in response to GenerateRandomColorEvent',
        () {
          colorBloc.stream.listen(
            expectAsync1(
              (state) => expect(
                state.runtimeType,
                NewColorState,
              ),
            ),
          );

          colorBloc.add(GenerateRandomColorEvent());
        },
      );

      test(
        'must emit InitialColorState in response to ResetToDefaultColorEvent',
        () {
          const int count = 25;

          colorBloc.stream.listen(
            expectAsync1(
              (state) => expect(
                state.runtimeType,
                InitialColorState,
              ),
              count: count,
            ),
          );

          for (int i = 0; i < count; i++) {
            colorBloc.add(ResetToDefaultColorEvent());
          }
        },
      );

      test(
        'must emit equal numbers of NewColorState and GenerateRandomColorEvent',
        () {
          const int count = 25;

          colorBloc.stream.listen(
            expectAsync1(
              (state) => expect(
                state.runtimeType,
                NewColorState,
              ),
              count: count,
            ),
          );

          for (int i = 0; i < count; i++) {
            colorBloc.add(GenerateRandomColorEvent());
          }
        },
      );
    },
  );
}
