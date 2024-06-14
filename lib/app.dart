import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:worldcup/cubit/language_module/language_cubit.dart';
import 'package:worldcup/cubit/language_module/language_state.dart';
import 'package:worldcup/extensions/device.dart';
import 'package:worldcup/route/app_pages.dart';
import 'package:worldcup/route/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguageCubit, LanguageState>(
      bloc: changeLanguageCubit,
      listenWhen: (previousState, currentState) =>
      previousState != currentState,
      listener: (previousState, currentState) {
        /// To update the selected local for language.
        Get.updateLocale(currentState.locale);
      },
      buildWhen: (previousState, currentState) => previousState != currentState,
      builder: (context, languageState) {
        return ScreenUtilInit(
            designSize: Device.defaultSize,
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                enableLog: false,
                navigatorKey: Get.key,
                initialRoute: AppRoutes.homePage,
                getPages: AppPages.routes,
                locale: languageState.locale,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                navigatorObservers: [],
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('de', ''),
                ],
                theme: ThemeData(
                  primaryColor: Colors.white,
                  useMaterial3: false,
                  pageTransitionsTheme: const PageTransitionsTheme(builders: {
                    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                  }),
                ),
                builder: (context, child) {
                  return MediaQuery(
                    data:
                    MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child ??
                        Container(
                          color: Colors.green,
                        ),
                  );
                },
              );
            });
      },
    );
  }

}
