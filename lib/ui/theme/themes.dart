import 'package:flutter/material.dart';

/// Dark theme generated with https://flutter-theme-editor.rob-b.co.uk/#/
final themeDark = ThemeData(
  brightness: Brightness.dark,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return Colors.deepPurple;
        if (states.contains(MaterialState.focused)) return Colors.deepPurple;
        if (states.contains(MaterialState.hovered)) return Colors.deepPurple;

        return Colors.deepPurple;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return Colors.deepPurple;
        if (states.contains(MaterialState.focused)) return Colors.deepPurple;
        if (states.contains(MaterialState.hovered)) return Colors.deepPurple;

        return Colors.deepPurple;
      }),
      shadowColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return Colors.deepPurple;
        if (states.contains(MaterialState.focused)) return Colors.deepPurple;
        if (states.contains(MaterialState.hovered)) return Colors.deepPurple;

        return Colors.deepPurple;
      }),
    ),
  ),
  textTheme: const TextTheme(
    button: TextStyle(
      color: Colors.white,
    ),
  ),
);

/// Light theme generated with https://flutter-theme-editor.rob-b.co.uk/#/
final themeLight = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return Colors.lime;
        if (states.contains(MaterialState.focused)) return Colors.lime;
        if (states.contains(MaterialState.hovered)) return Colors.lime;

        return Colors.lime;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return Colors.lime;
        if (states.contains(MaterialState.focused)) return Colors.lime;
        if (states.contains(MaterialState.hovered)) return Colors.lime;

        return Colors.lime;
      }),
      shadowColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return Colors.lime;
        if (states.contains(MaterialState.focused)) return Colors.lime;
        if (states.contains(MaterialState.hovered)) return Colors.lime;

        return Colors.lime;
      }),
    ),
  ),
  textTheme: const TextTheme(
    button: TextStyle(
      color: Colors.black,
    ),
  ),
);
