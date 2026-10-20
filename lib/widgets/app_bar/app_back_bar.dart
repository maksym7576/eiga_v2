


import 'dart:ui';

import 'package:eiga_v2/app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../logo/mini_logo.dart';

class AppBarBack extends ConsumerWidget {
  const AppBarBack({
    super.key,
    this.onBack,
    this.actions,
    this.showLogo = true,
  });

  final VoidCallback? onBack;
  final List<Widget>? actions;
  final bool showLogo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
        child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (onBack != null) {
                  onBack!();
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.surfaceGlass,
                  border: Border.all(color: context.colors.borderStrong, width: 1.5),
                ),
                child: Icon(Icons.arrow_back_rounded, size: 20, color: context.colors.textPrimary),
              ),
            ),
            if (actions != null)
              Row(mainAxisSize: MainAxisSize.min, children: actions!,)
            else if (showLogo)
              const MiniLogo(size: 32),
          ],
        ),
    );
  }
}