import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_state_notifier.dart';
import 'package:flutter_foundations/range_selecter_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const AppWidget());
}

// final randomizerProvider = ChangeNotifierProvider(
//   (ref) => RandomizerChangeNotifier(),
// );

final randomizerProvider =
    StateNotifierProvider<RandomizerStateNotifier, RandomizerState>(
  (ref) => RandomizerStateNotifier(),
);

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Randomizer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RangeSelectorPage(),
      ),
    );
  }
}
