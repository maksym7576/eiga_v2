

import 'package:flutter/material.dart';

import 'package:eiga_v2/app/theme/colors.dart';

class AppTypography {
  static const String fontSans = 'Plus Jakarta Sans';
  static const String fontJp = 'M PLUS Rounded 1c';

  static final TextStyle logo = TextStyle(
    fontFamily: fontSans,
    fontSize: 36,
    fontWeight: FontWeight.w800,
    color: AppColors().textPrimary,
    letterSpacing: -1.0,
  );

}