import 'package:flutter/material.dart';
import 'package:flutter_solid_tamplate/bloc/color_generator/color_bloc.dart';
import 'package:flutter_solid_tamplate/ui/home/home_screen.dart';
import 'package:flutter_solid_tamplate/ui/theme/themes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ColorBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Solid Random Color Demo',
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: ThemeMode.system,
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
