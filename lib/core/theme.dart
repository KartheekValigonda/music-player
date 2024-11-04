import 'package:flutter/material.dart';
import 'package:kartheek/core/color_pallet.dart';

class AppTheme{
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(22),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Pallete.borderColor,
          width: 2
        )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Pallete.gradient2,
              width: 2
          )
      ),
    )
  );
}