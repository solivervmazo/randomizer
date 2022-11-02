import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'randomizer_state_notifier.freezed.dart';

@freezed
class RandomizerState with _$RandomizerState {
  const RandomizerState._();
  const factory RandomizerState({
    @Default(0) int min,
    @Default(0) int max,
    int? generatedNumber,
  }) = _RandomizerState;
}

class RandomizerStateNotifier extends StateNotifier<RandomizerState> {
  RandomizerStateNotifier() : super(const RandomizerState());

  final _randomGenerator = Random();

  void generateRandomNumber() {
    state = state.copyWith(
        generatedNumber:
            state.min + _randomGenerator.nextInt(state.max + 1 - state.min));
  }

  void setMin(int value) {
    state = state.copyWith(min: value);
  }

  void setMax(int value) {
    state = state.copyWith(max: value);
  }
}

// class RandomizerChangeNotifier extends ChangeNotifier {
//   final _randomGenerator = Random();

//   int? _generatedNumber;
//   int? get generatedNumber => _generatedNumber;

//   int min = 0, max = 0;

//   void generateRandomNumber() {
//     _generatedNumber = min + _randomGenerator.nextInt(max + 1 - min);
//     notifyListeners();
//   }
// }
