import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worldcup/app.dart';
import 'package:worldcup/cubit/theme_module/theme_cubit.dart';
import 'package:worldcup/localization/localization_service.dart';

void main() {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// To Set up the app localization.
    await LocalizationService.instance.setup();

    /// To Set the fix device orientation.
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((value) async {
      /// To get the last decided theme.
      changeThemeCubit.onDecideThemeChange();

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
      )); // 1

      /// Start point of the application.
      runApp(
        const App(),
      );
    });
  }, (Object error, StackTrace stack) async {
    debugPrint('main = = = = ${error.toString()}');
    await Future.wait([
      // FlutterCrashlytics().reportCrash(error, stackTrace, forceCrash: false);
    ]);
  });
}
