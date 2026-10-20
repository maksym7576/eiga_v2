

import 'package:intl/intl.dart';

class LanguageDTO {
  late String code;
  late String name;
  late String subtitle;
  late bool tokenizeWithAi;

  late List<String> readingOptions;
  late List<String> removeSpacing;

  TextDirection textDirection = TextDirection.LTR;
  Map<String, String>? localization;

}