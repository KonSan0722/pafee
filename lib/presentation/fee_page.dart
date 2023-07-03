import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pafee_app/Application/widget/fee_page_container.dart';
import 'package:pafee_app/Application/widget/start_button.dart';
import 'package:pafee_app/Application/widget/stop_button.dart';
import 'package:pafee_app/Application/widget/timer_button.dart';
import '../Application/provider/pafee_provider.dart';

class FeePage extends ConsumerWidget {
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
    ref.listen(updateFeeNotifierProvider, (oldState, newState) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("駐車料金が$newState円になりました")));
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const LoginContainer(),
            TimerButton(),
            Text("$updateFeeNotifier"),
            Text("$changeContainerNotifier")
          ],
        ),
      ),
    );
  }
}
