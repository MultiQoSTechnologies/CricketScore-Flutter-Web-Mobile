
import 'package:flutter/material.dart';

abstract class LanguageState {
  final Locale locale;

  LanguageState(this.locale);
}

class SelectedLanguageState extends LanguageState {
  SelectedLanguageState(Locale locale) : super(locale);
}
