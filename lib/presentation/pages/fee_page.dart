import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pafee_app/presentation/widgets/back_home_Button.dart';
import 'package:pafee_app/presentation/widgets/timer_button.dart';
import '../../Application/state/pafee_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/fee_page_container.dart';

class FeePage extends HookConsumerWidget {
  FeePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeNotifier = ref.watch(timeNotifierProvider);
    final feeNotifier = ref.watch(feeNotifierProvider);
    final maximumFeeNotifier = ref.watch(maximumFeeNotifierProvider);
    final maximumTimeNotifier = ref.watch(maximumTimeNotifierProvider);
    // int isTime = int.parse(timeNotifier) * 60;
    final changeContainerNotifier = ref.watch(changeContainerNotifierProvider);
    final updateFeeNotifier = ref.watch(updateFeeNotifierProvider);
    final changeTextContainerNotifer =
        ref.watch(changeTextContainerNotifierProvider);
    ref.listen(updateFeeNotifierProvider, (oldState, newState) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("駐車料金が$newState円になりました")));
    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 208, 52),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const LoginContainer(),
            const TimerButton(),
            changeContainerNotifier ? const BackHomeButton() : Container(),
          ],
        ),
      ),
    );
  }
}
