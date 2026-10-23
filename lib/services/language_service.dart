import 'package:eiga_v2/data/DTOs/language_dto.dart';
import 'package:eiga_v2/data/seeds/language_seed.dart';

class LanguageService {
  final List<LanguageDTO> _languages;

  LanguageService({List<LanguageDTO>? initialLanguages})
  : _languages = initialLanguages ?? List.from(LanguageSeed.languages);

  List<LanguageDTO> getAllLanguages() {
    return List.unmodifiable(_languages);
  }

  LanguageDTO? getLanguageByCode(String code) {
    for (final lang in _languages) {
      if (lang.code.toLowerCase() == code.toLowerCase()) {
        return lang;
      }
    }
    return null;
  }

  String getLocazication(String langCode, String key) {
    final language = getLanguageByCode(langCode) ?? getLanguageByCode('en');
    if (language?.localization != null && language!.localization!.containsKey(key)) {
      return language.localization![key]!;
    }

    final enLanguage = getLanguageByCode('en');
    if (enLanguage?.localization != null && enLanguage!.localization!.containsKey(key)) {
      return enLanguage.localization![key]!;
    }

    return key;
  }

  List<LanguageDTO> getLanguagesByLocalization() {
    return _languages
        .where((lang) => lang.localization != null && lang.localization!.isNotEmpty)
        .toList();
  }
}