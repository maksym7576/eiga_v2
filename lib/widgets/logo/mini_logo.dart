import 'package:eiga_v2/app/theme/app_typography.dart';
import 'package:eiga_v2/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MiniLogo extends StatelessWidget {
  const MiniLogo({super.key, this.size = 40});

  final double size;

  @override
  Widget build(BuildContext context) {
    final base = AppTypography.logo.copyWith(fontSize: size, height: 1);
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          'eig',
          style: base.copyWith(
            shadows: [
              Shadow(
                color: context.colors.logoShadow.withOpacity(0.5),
                blurRadius: 30,
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(0, size * 0.09),
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (r) => context.colors.gradTextCyan.createShader(r),
            child: Text(
              'あ',
              style: base.copyWith(color: context.colors.textPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
