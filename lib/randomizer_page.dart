import 'package:flutter/material.dart';
import 'package:flutter_foundations/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomizerPage extends ConsumerWidget {
  const RandomizerPage({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomizer = ref.watch(randomizerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: Center(
        child: Text(
          randomizer.generatedNumber?.toString() ?? 'Generate anumber',
          style: const TextStyle(
            fontSize: 42,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Generate'),
        onPressed: () {
          ref.read(randomizerProvider.notifier).generateRandomNumber();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
