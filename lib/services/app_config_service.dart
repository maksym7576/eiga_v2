import '../app/app_configs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigService {
  final SharedPreferences _prefs;

  AppConfigService(this._prefs);

  T get <T>(ConfigKey<T> config) {
    final value = _prefs.get(config.key);
    if (value is T) return value;
    return config.defaultValue;
  }

  Future<bool> set<T>(ConfigKey<T> config, T value) async {
    if (value is String) return await _prefs.setString(config.key, value);
    if (value is bool) return await _prefs.setBool(config.key, value);
    if (value is int) return await _prefs.setInt(config.key, value);
    if (value is double) return await _prefs.setDouble(config.key, value);
    if (value is List<String>) return await _prefs.setStringList(config.key, value);
    throw UnsupportedError('Unsupported type: ${value.runtimeType}');
  }
}

extension AppConfigServiceShartcuts on AppConfigService {
  String get appLanguage => get(AppConfigs.appLanguage);
  set appLanguage(String value) => set(AppConfigs.appLanguage, value);

  bool get hasCompletedStartup => get(AppConfigs.hasCompletedStartup);
  set hasCompletedStartup(bool value) => set(AppConfigs.hasCompletedStartup, value);
}