import 'package:eiga_v2/app/app_configs.dart';
import 'package:eiga_v2/providers/service_providers.dart';
import 'package:eiga_v2/services/app_config_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/DTOs/language_dto.dart';

class LocalizationSubScreen extends HookConsumerWidget {
  const LocalizationSubScreen({
    super.key,
    required this.onNext,
});

  final ValueChanged<LanguageDTO> onNext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appConfigService = ref.read(appConfigServiceProvider);
    final languageService = ref.read(languageServiceProvider);

    final initialLang = languageService.getLanguageByCode(appConfigService.appLanguage);
    
    final selectedLanguage = useState<LanguageDTO?>(initialLang);

    final currentCode = selectedLanguage.value?.code ?? AppConfigs.appLanguage.defaultValue;
    String t(String key) => languageService.getLocazication(currentCode, key);

    final searchController = useTextEditingController();
    final searchQuery = useListenable(searchController).text.trim().toLowerCase();

    final filteredLanguages = languageService.getLanguagesByLocalization();

  }
}