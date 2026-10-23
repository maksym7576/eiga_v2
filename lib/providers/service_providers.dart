


import 'package:eiga_v2/services/app_config_service.dart';
import 'package:eiga_v2/services/language_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Fail to initialize shared preferences');
});

final appConfigServiceProvider = Provider<AppConfigService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return AppConfigService(prefs);
});

final languageServiceProvider = Provider<LanguageService>((ref) {
  return LanguageService();
});