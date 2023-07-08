import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pafee_provider.g.dart';

@riverpod
class FeeNotifier extends _$FeeNotifier {
  @override
  String build() {
    return "0";
  }

  void save(String newText) {
    state = newText;
  }
}

@riverpod
class TimeNotifier extends _$TimeNotifier {
  @override
  String build() {
    return "0";
  }

  void save(String newText) {
    state = newText;
  }
}

@riverpod
class MaximumFeeNotifier extends _$MaximumFeeNotifier {
  @override
  String build() {
    return "0";
  }

  void save(String newText) {
    state = newText;
  }
}

@riverpod
class MaximumTimeNotifier extends _$MaximumTimeNotifier {
  @override
  String build() {
    return "0";
  }

  void save(String newText) {
    state = newText;
  }
}

@riverpod
class UpdateFeeNotifier extends _$UpdateFeeNotifier {
  int newValue = 0;
  int elapsedTime = 0;

  @override
  int build() {
    return 0;
  }

  void save(int newNumber) {
    state = newNumber;
  }
}

@riverpod
class ChangeContainerNotifier extends _$ChangeContainerNotifier {
  @override
  bool build() {
    return true;
  }

  void change() {
    state = !state;
  }
}

@riverpod
class ChangeTextContainerNotifier extends _$ChangeTextContainerNotifier {
  @override
  bool build() {
    return true;
  }

  void changeText(value) {
    if (int.parse(value) == 0 || value == "") {
      state = true;
    } else {
      state = false;
    }
  }
}
