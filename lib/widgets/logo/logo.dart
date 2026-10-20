import 'dart:async';

import 'package:eiga_v2/app/theme/app_typography.dart';
import 'package:eiga_v2/app/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class Logo extends StatefulWidget {
  const Logo({
    super.key,
    this.size = 28.0,
    this.firstSwapDelay = const Duration(seconds: 5),
    this.swapInterval = const Duration(seconds: 30),
    this.glowColor,
  });

  final double size;
  final Duration firstSwapDelay;
  final Duration swapInterval;
  final Color? glowColor;

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
  );

  Timer? _first;
  Timer? _periodic;

  bool _kana = false;
  bool _busy = false;

  @override
  void initState() {
    super.initState();

    _first = Timer(widget.firstSwapDelay, () => _swap(true));
    _periodic = Timer.periodic(widget.swapInterval,
            (_) => _swap(!_kana));
  }

  @override
  void dispose() {
    _first?.cancel();
    _periodic?.cancel();
    super.dispose();
  }

  Future<void> _swap(bool toKana) async {
    if (_busy || !mounted) return;
    _busy = true;

    if (MediaQuery.disableAnimationsOf(context)) {
      setState(() => _kana = toKana);
      _busy = false;
      return;
    }

    await _controller.animateTo(1, curve: Curves.easeOut);
    if (!mounted) return;

    setState(() => _kana = toKana);
    _busy = false;
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    final colors = context.colors;

    final latin = AppTypography.logo.copyWith(
      fontSize: size,
      height: 1,
      letterSpacing: -size * 0.02,
      color: colors.textPrimary,
      shadows: [
        Shadow(
          color: (widget.glowColor ?? context.colors.logoShadow)
              .withOpacity(0.5),
          blurRadius: 24,
        ),
      ],
    );

    final japanese = AppTypography.logoJapanese(size: size);

    Widget baselineRow(List<Widget> children) =>
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: children,
        );

    final character = Stack(
      children: [
        Opacity(
          opacity: 0,
          child: Text(
            'あ', style: japanese,
          ),
        ),
        if (_kana)
          Transform.translate(
            offset: Offset(0, size * 0.09),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: colors.gradTextCyan.createShader,
              child: Text('あ', style: japanese),
            ),
          )
        else
          Text('a', style: latin)
      ],
    );
    final changingPart = baselineRow([
      Text('ig', style: latin),
      character,
    ]);

    return GestureDetector(
      onTap: () => _swap(!_kana),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Semantics(
          label: 'eiga',
          button: true,
          excludeSemantics: true,
          child: baselineRow([
            Text('e', style: latin),
            AnimatedBuilder(
              animation: _controller,
              child: changingPart,
              builder: (context, child) =>
                  Opacity(
                    opacity: 1 - _controller.value,
                    child: Transform.translate(
                      offset: Offset(0, -size * 0.35 * _controller.value),
                      child: child,
                    ),
                  ),
            ),
          ]),
        ),
      ),
    );
  }
}
