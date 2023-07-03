import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pafee_app/Application/provider/pafee_provider.dart';

class TimerButton extends ConsumerWidget {
  TimerButton({super.key});

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
        if (changeContainerNotifier == false) {
          elapsedTime++;
          if (elapsedTime == int.parse(maximumTimeNotifier)) {
            final notifier = ref.read(updateFeeNotifierProvider.notifier);
            notifier.save(int.parse(maximumFeeNotifier));
            timer.cancel();
          } else {
            final notifier = ref.read(updateFeeNotifierProvider.notifier);
            newValue = newValue + int.parse(feeNotifier);
            notifier.save(newValue);
          }
        } else {
          timer.cancel();
        }
      });
    }

    return ElevatedButton(
        onPressed: () {
          final notifier = ref.read(changeContainerNotifierProvider.notifier);
          notifier.change();
          startTimer();
        },
        child:
            changeContainerNotifier ? const Text('計算開始') : const Text("計算終了"));
  }
}

int elapsedTime = 0;
int newValue = 0;
Timer? calculateTimer;
