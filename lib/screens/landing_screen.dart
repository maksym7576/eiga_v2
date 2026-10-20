import 'package:eiga_v2/widgets/backgrounds/aurora_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LandingScreen extends HookConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = useState(0);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        // children: [
        //   const AuroraBackground(),
        //   if (currentStep.value ==0)
        //
        // ],
      ),
    );
    return Scaffold(
      body: Center(
        child: Text('Landing Screen'),
      ),
    );
  }
}