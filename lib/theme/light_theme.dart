import 'package:flutter/material.dart';

import '../theme/theme_colors.dart';
import 'base_theme.dart';

class AppLightTheme extends BaseTheme {
  static final AppLightTheme _instance = AppLightTheme._();

  AppLightTheme._();

  factory AppLightTheme() => _instance;

  @override
  Color get primaryColor => Colors.black;

  @override
  Color get accentColor => Colors.black;

  @override
  Brightness get brightness => Brightness.light;

  @override
  ThemeData get lightTheme {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      brightness: brightness,
      scaffoldBackgroundColor: LightThemeColors.white,
      shadowColor: LightThemeColors.white,
    );
  }

  @override
  Color? get darkAccentColor => null;

  @override
  Color? get darkPrimaryColor => null;

  @override
  ThemeData? get darkTheme => null;

  /// This will use for custom colors which couldn't part of the theme data.
  @override
  Map<String, Color> get customColor => {

        AppColors.white: LightThemeColors.white,
        AppColors.black: LightThemeColors.black,
        AppColors.primary: LightThemeColors.primary,
        AppColors.secondPrimary: LightThemeColors.secondPrimary,
        AppColors.orange: LightThemeColors.orange,
        AppColors.grey: LightThemeColors.grey,
        AppColors.lightGrey: LightThemeColors.lightGrey,
        AppColors.lightGrey2: LightThemeColors.lightGrey2,
        AppColors.blackShaded: LightThemeColors.blackShaded,
        AppColors.darkGrey: LightThemeColors.darkGrey,
        AppColors.bone: LightThemeColors.bone,
        AppColors.seashellPeach: LightThemeColors.seashellPeach,
        AppColors.pampas: LightThemeColors.pampas,

      };
}
