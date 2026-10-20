

import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../app/theme/app_gradients.dart';
import '../../app/theme/colors.dart';

class AuroraBackground extends HookWidget {
  const AuroraBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 22));
    useEffect(() {
      controller.repeat();
      return null;
    }, [controller]);

    return RepaintBoundary(
      child: IgnorePointer(
        child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1D0D45), Color(0xFF170A35), Color(0xFF1A1058)],
                stops: [0.0, 0.45, 1.0],
              ),
            ),
          child: LayoutBuilder(
              builder: (context, box) {
                final w = box.maxWidth;
                final h = box.maxHeight;
                final s = math.max(w, h) * 1.05;

                return AnimatedBuilder(
                  animation: controller,
                  child: const _Vignette(),
                  builder: (context, vignette) {
                    final t = controller.value * math.pi;
                    return Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        _blob(
                          left: -0.25 * w + math.sin(t) * 0.06 * w,
                          top: -0.10 * h + math.cos(t) * 0.04 * h,
                          size: s,
                          color: context.colors.auroraBlobPurple,
                          opacity: 0.65,
                        ),
                        _blob(
                          left: 0.50 * w + math.cos(t) * 0.06 * w,
                          top: 0.15 * h + math.sin(t) * 0.05 * h,
                          size: s * 0.95,
                          color: context.colors.auroraBlobSky,
                          opacity: 0.50,
                        ),
                        _blob(
                          left: -0.15 * w + math.sin(t + 1.5) * 0.05 * w,
                          top: 0.40 * h + math.cos(t + 1.5) * 0.04 * h,
                          size: s * 1.1,
                          color: context.colors.auroraBlobIndigo,
                          opacity: 0.60,
                        ),
                        _blob(
                          left: 0.20 * w + math.cos(t + 2) * 0.04 * w,
                          top: -0.20 * h + math.sin(t + 2) * 0.04 * h,
                          size: s * 0.75,
                          color: context.colors.auroraBlobBlue,
                          opacity: 0.55,
                        ),
                        Positioned.fill(child: vignette!),
                      ],
                    );
                  },
                );
              },
          ),
        ),
      ),
    );
  }
}

Widget _blob({
  required double left,
  required double top,
  required double size,
  required Color color,
  double opacity = 0.85,
}) {
  return Positioned(
    left: left,
    top: top,
    width: size,
    height: size,
    child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppGradients.blob(color, opacity: opacity)),
    ),
  );
}

class _Vignette extends StatelessWidget {
  const _Vignette();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              radius: 1.2,
              colors: [Colors.transparent, context.colors.vignetteShadow],
              stops: [0.4, 1.0],
          ),
        ),
    );
  }
}