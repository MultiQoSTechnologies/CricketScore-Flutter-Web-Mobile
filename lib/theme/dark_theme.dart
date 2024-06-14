import 'package:flutter/material.dart';

import '../theme/theme_colors.dart';
import 'base_theme.dart';

class AppDarkTheme extends BaseTheme {
  static final AppDarkTheme _instance = AppDarkTheme._();

  AppDarkTheme._();

  factory AppDarkTheme() => _instance;

  @override
  Color get primaryColor => Colors.black;

  @override
  Color get accentColor => Colors.black;

  @override
  Brightness get brightness => Brightness.dark;

  @override
  ThemeData get darkTheme {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      brightness: brightness,
      scaffoldBackgroundColor: DarkThemeColors.black,
      shadowColor: DarkThemeColors.white,
    );
  }

  @override
  Color? get darkAccentColor => null;

  @override
  Color? get darkPrimaryColor => null;

  @override
  ThemeData? get lightTheme => null;

  /// This will use for custom colors which couldn't part of the theme data.
  @override
  Map<String, Color> get customColor => {
        AppColors.white: DarkThemeColors.black,
        AppColors.black: DarkThemeColors.white,
        AppColors.primary: DarkThemeColors.primary,
        AppColors.secondPrimary: DarkThemeColors.secondPrimary,
        AppColors.orange: DarkThemeColors.orange,
        AppColors.grey: DarkThemeColors.grey,
        AppColors.blackShaded: DarkThemeColors.blackShaded,
        AppColors.bone: DarkThemeColors.bone,
        AppColors.seashellPeach: DarkThemeColors.seashellPeach,
        AppColors.pampas: DarkThemeColors.pampas,
        AppColors.darkGrey: DarkThemeColors.darkGrey,
        AppColors.lightGrey: DarkThemeColors.lightGrey,
        AppColors.lightGrey2: DarkThemeColors.lightGrey2,
  };
}
