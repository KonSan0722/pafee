import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pafee_app/presentation/widgets/back_home_Button.dart';
import 'package:pafee_app/presentation/widgets/result_button.dart';
import 'package:pafee_app/presentation/widgets/timer_button.dart';
import '../../Application/state/pafee_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/fee_page_container.dart';

class FeePage extends HookConsumerWidget {
  FeePage({super.key});
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changeContainerNotifier = ref.watch(changeContainerNotifierProvider);
    final updateFeeNotifier = ref.watch(updateFeeNotifierProvider);
    final changeTextContainerNotifer =
        ref.watch(changeTextContainerNotifierProvider);

    ref.listen(updateFeeNotifierProvider, (oldState, newState) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("駐車料金が$newState円になりました")));
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 208, 52),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const LoginContainer(),
            TimerButton(isVisible: ref.read(changeContainerNotifierProvider)),
            changeContainerNotifier ? Container() : const ResultButton(),
            changeContainerNotifier ? const BackHomeButton() : Container(),
          ],
        ),
      ),
    );
  }
}
