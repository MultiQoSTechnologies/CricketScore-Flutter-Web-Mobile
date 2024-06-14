import 'package:flutter/material.dart' show Locale;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worldcup/constant/key_constant.dart';
import 'en.dart';
import 'de.dart';
import 'locale.dart';

enum LanguageType {
  en,
  de,
}

class LocalizationService {
  LocalizationService._internal();

  static final LocalizationService _instance = LocalizationService._internal();

  static LocalizationService get instance => _instance;

  Locale get local => Locale(_languageType.name);

  AppLocale get _appLocale => _getLocal();

  AppLocale? _selectedLang;

  LanguageType _languageType = LanguageType.en;

  LanguageType get languageType => _languageType;

  static AppLocale get appLocale => LocalizationService.instance._appLocale;

  bool _hasLanguageSelected = false;

  AppLocale _getLocal() {
    if (_selectedLang != null) {
      return _selectedLang!;
    }

    switch (_languageType) {
      case LanguageType.en:
        _selectedLang = EN();
        break;
      case LanguageType.de:
        _selectedLang = DE();
        break;
    }

    return _selectedLang!;
  }

  Future<void> setup() async {
    await _configureLocalization();
    await _checkHasUserSelectedLanguageOrNot();
  }

  Future<void> setLocal({LanguageType type = LanguageType.en}) async {
    _selectedLang = null;
    var preferences = await SharedPreferences.getInstance();
    preferences.setString(KeyConstant.languageLocalType, type.name);
    await _configureLocalization();
  }

  Future<void> _configureLocalization() async {
    var preferences = await SharedPreferences.getInstance();
    var savedType =
        preferences.getString(KeyConstant.languageLocalType) ?? LanguageType.en.name;
    var langType = LanguageType.values.byName(savedType);
    _languageType = langType;
    _getLocal();
  }

  Future<void> savedUserSelectedLanguage() async {
    var preferences = await SharedPreferences.getInstance();
    preferences.setBool(KeyConstant.languageHasUserSelected, true);
    _hasLanguageSelected = true;
  }

  Future<void> _checkHasUserSelectedLanguageOrNot() async {
    var preferences = await SharedPreferences.getInstance();
    _hasLanguageSelected = preferences.getBool(KeyConstant.languageHasUserSelected) ?? false;
  }

  /// To check, Language is selected or not by user.
  /// true: Language is selected
  /// false: Language is not selected
  static bool get hasLanguageSelected {
    return LocalizationService.instance._hasLanguageSelected;
  }
}
