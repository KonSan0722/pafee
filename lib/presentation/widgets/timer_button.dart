import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pafee_app/Application/state/pafee_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerButton extends HookConsumerWidget {
  const TimerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stopTimer = useState(false);
    var elapsedTime = useState(0);
    var newValue = useState(0);
    final timeNotifier = ref.watch(timeNotifierProvider);
    final feeNotifier = ref.watch(feeNotifierProvider);
    final maximumFeeNotifier = ref.watch(maximumFeeNotifierProvider);
    final maximumTimeNotifier = ref.watch(maximumTimeNotifierProvider);
    final updateFeeNotifier = ref.watch(updateFeeNotifierProvider);
    final changeContainerNotifier = ref.watch(changeContainerNotifierProvider);

    void startElapsedTimer() {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (stopTimer.value == true) {
          if (elapsedTime.value == int.parse(maximumTimeNotifier)) {
            final notifier = ref.read(updateFeeNotifierProvider.notifier);
            notifier.save(int.parse(maximumFeeNotifier));
            timer.cancel();
          } else {
            elapsedTime.value = elapsedTime.value + 1;
          }
        } else {
          timer.cancel();
        }
      });
    }

    void startCalculateTimer() {
      Timer.periodic(Duration(seconds: int.parse(timeNotifier)), (timer) {
        if (stopTimer.value == true) {
          if (elapsedTime.value == int.parse(maximumTimeNotifier) &&
              int.parse(maximumTimeNotifier) != 0) {
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
          final notifier = ref.read(changeContainerNotifierProvider.notifier);
          notifier.change();
          startElapsedTimer();
          startCalculateTimer();
        },
        child:
            changeContainerNotifier ? const Text('計算開始') : const Text("計算終了"));
  }
}
