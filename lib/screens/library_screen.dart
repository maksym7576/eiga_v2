import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibraryScreen extends HookConsumerWidget {
  const LibraryScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('Library Screen'),
      ),
    );
  }
}