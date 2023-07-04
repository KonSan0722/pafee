import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pafee_app/Application/provider/pafee_provider.dart';

class StopButton extends ConsumerWidget {
  const StopButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(changeContainerNotifierProvider);
    return ElevatedButton(
      onPressed: () {
        HapticFeedback.vibrate();
        final changeNotifier =
            ref.read(changeContainerNotifierProvider.notifier);
        changeNotifier.change();

        print(ref.watch(changeContainerNotifierProvider));
        print("計算終了");
      },
      child: const Text("計算終了"),
    );
  }
}
