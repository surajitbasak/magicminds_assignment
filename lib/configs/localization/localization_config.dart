import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Locale appLocale = const Locale('en');

List<String> appLanguages = ['English', 'हिंदी', 'বাংলা'];

/// Returns the ISO 639-1 language code for the given language.
///
/// Currently supported languages are English, Hindi and Bengali.
///
/// The returned language code is the ISO 639-1 code for the language
/// if it is supported, else it returns the default language code which
/// is 'en' for English.
String getLanguageCode(String language) {
  switch (language) {
    case 'English':
      return 'en';
    case 'हिंदी':
      return 'hi';
    case 'বাংলা':
      return 'bn';
    default:
      return 'en';
  }
}

/// Returns the full name of the language given the ISO 639-1 language code.
///
/// Currently supported languages are English, Hindi and Bengali.
///
/// The returned language name is the full name of the language if it is
/// supported, else it returns the default language name which is 'English'.
String getLanguage(String languageCode) {

  switch (languageCode) {
    case 'en':
      return 'English';
    case 'hi':
      return 'हिंदी';
    case 'bn':
      return 'বাংলা';
    default:
      return 'English';
  }
}

final GlobalKey navigatorKey = GlobalKey();

AppLocalizations get localization => AppLocalizations.of(navigatorKey.currentContext!)!;
