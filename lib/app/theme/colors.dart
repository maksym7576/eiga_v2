

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

  final Color auroraBgStart = const Color(0xFF1D0D45);
  final Color auroraBgMiddle = const Color(0xFF170A35);
  final Color auroraBgEnd = const Color(0xFF1A1058);

  final Color auroraBlobPurple = const Color(0xFF7C3AED);
  final Color auroraBlobSky = const Color(0xFF0EA5E9);
  final Color auroraBlobIndigo = const Color(0xFF6366F1);
  final Color auroraBlobBlue = const Color(0xFF2563EB);

  final Color vignetteShadow = const Color(0x99000000);
}

extension AppColorsX on BuildContext {
  AppColors get colors => const AppColors();
}