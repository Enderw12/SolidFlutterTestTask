import 'package:flutter/material.dart';
import 'package:flutter_solid_tamplate/bloc/color_generator/color_bloc.dart';
import 'package:flutter_solid_tamplate/ui/hello_screen/hello_screen.dart';
import 'package:flutter_solid_tamplate/ui/home/home_screen.dart';
import 'package:flutter_solid_tamplate/ui/theme/themes.dart';
import 'package:provider/provider.dart';

/// This widget is the root of the application.
class MyApp extends StatelessWidget {
  /// This widget is the root of the application.
  const MyApp();

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ColorBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Solid Random Color Generator Demo',
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: ThemeMode.system,
        initialRoute: HelloScreen.id,
        routes: {
          // TODO: remove unused routes with next refactoring cycle
          HomeScreen.id: (context) => const HomeScreen(),
          HelloScreen.id: (context) => const HelloScreen(),
        },
      ),
    );
  }
}
