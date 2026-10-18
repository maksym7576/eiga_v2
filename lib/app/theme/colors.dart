

import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  const AppColors();

  final Color textPrimary = const Color(0xFFcbd5e1);
  final Color surfaceGlass = const Color.fromRGBO(12, 8, 30, 0.78);
  final Color borderStrong = const Color.fromRGBO(255, 255, 255, 0.28);

  final Color logoShadow = const Color(0xFF38bdf8);
  final LinearGradient gradTextCyan = const LinearGradient(
    colors: [Colors.cyan, Colors.blue],
  );
}

extension AppColorsX on BuildContext {
  AppColors get colors => const AppColors();
}