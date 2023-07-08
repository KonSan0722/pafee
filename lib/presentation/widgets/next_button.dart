import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pafee_app/Application/state/pafee_provider.dart';

import 'alert.dart';

class NextButton extends ConsumerWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fee = ref.watch(feeNotifierProvider);
    final time = ref.watch(timeNotifierProvider);
    final maximumTime = ref.watch(maximumTimeNotifierProvider);
    return IconButton(
        icon: const Icon(Icons.navigate_next),
        iconSize: 60,
        color: Colors.black,
        onPressed: () {
          final notiier =
              ref.read(changeTextContainerNotifierProvider.notifier);
          notiier.changeText(maximumTime);
          HapticFeedback.vibrate();
          if (fee == "0" && time == "0") {
            showDialog(
                context: context,
                builder: (context) {
                  return const Alert(
                    textMessage: "料金、加算される時間が入力されていないか、無効な値か文字が入力されています。",
                  );
                });
          } else if (fee == "0") {
            showDialog(
                context: context,
                builder: (context) {
                  return const Alert(
                    textMessage: "'料金が入力されていないか、無効な値が入力されています'",
                  );
                });
          } else if (time == "0") {
            showDialog(
                context: context,
                builder: (context) {
                  return const Alert(
                    textMessage: '加算される時間が入力されていないか、無効な値が入力されています',
                  );
                });
          } else {
            context.push("/fee");
          }
          ;
        });
  }
}
