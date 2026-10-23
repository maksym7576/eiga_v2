
class AppConfigs {
  static const appLanguage = ConfigKey<String>('app_language', 'en');
  static const hasCompletedStartup = ConfigKey<bool>('has_completed_startup', false);
}

class ConfigKey<T> {
  final String key;
  final T defaultValue;

  const ConfigKey(this.key, this.defaultValue);
}