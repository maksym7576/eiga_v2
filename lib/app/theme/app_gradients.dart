

import 'package:flutter/material.dart';

class AppGradients {
  AppGradients();

  static RadialGradient blob(Color color, {double opacity = 0.9}) {
    return RadialGradient(
      colors: [color.withOpacity(opacity), color.withOpacity(0)],
    );
  }
}