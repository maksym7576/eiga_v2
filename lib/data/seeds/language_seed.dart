

import 'package:eiga_v2/app/localization/en_translations.dart';
import 'package:eiga_v2/app/localization/uk_translations.dart';
import 'package:eiga_v2/data/DTOs/language_dto.dart';

class LanguageSeed {
  static final List<LanguageDTO> languages = [
    LanguageDTO()
      ..code = 'ja'
      ..name = 'Japanese'
      ..subtitle = '日本語'
      ..readingOptions = ['KANJI', 'KANA', 'ROMAJI']
      ..removeSpacing = ['KANJI', 'KANA']
      ..localization = null,
    LanguageDTO()
      ..code = 'en'
      ..name = 'English'
      ..subtitle = 'English'
      ..readingOptions = ['ENGLISH']
      ..removeSpacing = []
      ..localization = enTranslations,
    LanguageDTO()
    ..code = 'uk'
    ..name = 'Ukrainian'
    ..subtitle = 'Українська'
    ..readingOptions = ['UKRAINIAN']
    ..removeSpacing = []
    ..localization = ukTranslations,
  ];
}