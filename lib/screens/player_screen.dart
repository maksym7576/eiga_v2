import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayerScreen extends HookConsumerWidget {
  const PlayerScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('Player Screen'),
      ),
    );
  }
}