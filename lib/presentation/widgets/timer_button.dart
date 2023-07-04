import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pafee_app/Application/provider/pafee_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerButton extends HookConsumerWidget {
  TimerButton({super.key});
  // var stopTimer = true;
  // var elapsedTime = 0;
  // var newValue = 0;
  // Timer? calculateTimer;
  var stopTimer = useState(false);
  var elapsedTime = useState(0);
  var newValue = useState(0);
  Timer? calculateTimer;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeNotifier = ref.watch(timeNotifierProvider);
    final feeNotifier = ref.watch(feeNotifierProvider);
    final maximumFeeNotifier = ref.watch(maximumFeeNotifierProvider);
    final maximumTimeNotifier = ref.watch(maximumTimeNotifierProvider);
    final updateFeeNotifier = ref.watch(updateFeeNotifierProvider);
    final changeContainerNotifier = ref.watch(changeContainerNotifierProvider);

    void startTimer() {
      calculateTimer =
          Timer.periodic(Duration(seconds: int.parse(timeNotifier)), (timer) {
        if (stopTimer.value == true) {
          elapsedTime.value = elapsedTime.value + 1;
          if (elapsedTime.value == int.parse(maximumTimeNotifier)) {
            final notifier = ref.read(updateFeeNotifierProvider.notifier);
            notifier.save(int.parse(maximumFeeNotifier));
            timer.cancel();
          } else {
            final notifier = ref.read(updateFeeNotifierProvider.notifier);
            newValue.value = newValue.value + int.parse(feeNotifier);
            notifier.save(newValue.value);
          }
        } else {
          timer.cancel();
        }
      });
    }

    return ElevatedButton(
        onPressed: () {
          stopTimer.value = !stopTimer.value;
          startTimer();
        },
        child:
            changeContainerNotifier ? const Text('計算開始') : const Text("計算終了"));
  }
}

// var stopTimer = true;
// var elapsedTime = 0;
// var newValue = 0;
// Timer? calculateTimer;
// var stopTimer = useState(false);
// var elapsedTime = useState(0);
// var newValue = useState(0);
// Timer? calculateTimer;
