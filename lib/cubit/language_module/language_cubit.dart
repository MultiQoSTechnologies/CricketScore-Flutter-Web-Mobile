import 'package:flutter/material.dart' show Locale;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldcup/cubit/language_module/language_state.dart';
import 'package:worldcup/localization/localization_service.dart';

LanguageCubit changeLanguageCubit = LanguageCubit()..onDecideLanguageChange();

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(SelectedLanguageState(Locale(LanguageType.en.name)));

  void toEnglish() async {
    await LocalizationService.instance.setLocal(type: LanguageType.en);
    emit(SelectedLanguageState(LocalizationService.instance.local));
  }

  void toGerman() async {
    await LocalizationService.instance.setLocal(type: LanguageType.de);
    emit(SelectedLanguageState(LocalizationService.instance.local));
  }

  void onDecideLanguageChange() async {
    // var languageType = await LocalizationService.instance.languageType();
    var languageType = LocalizationService.instance.languageType;

    switch (languageType) {
      case LanguageType.en:
        toEnglish();
        //_saveOptionValue(0);
        break;

      case LanguageType.de:
        toGerman();
        //_saveOptionValue(1);
        break;
    }
  }

  // Future<void> _saveOptionValue(int optionValue) async {
  //   var preferences = await SharedPreferences.getInstance();
  //   await preferences.setInt('lang_option', optionValue);
  // }

  // Future<int> getOption() async {
  //   try {
  //     var preferences = await SharedPreferences.getInstance();
  //     int option = preferences.getInt('lang_option') ?? 0;
  //     return option;
  //   } catch (e) {
  //     return 1;
  //   }
  // }

  // Future<LanguageType> getLanguageType() async {
  //   var option = await getOption();
  //
  //   switch (option) {
  //     case 0:
  //
  //       /// English Language
  //       return LanguageType.en;
  //
  //     case 1:
  //
  //       ///German Language
  //       return LanguageType.de;
  //   }
  //
  //   return LanguageType.en;
  // }
}
