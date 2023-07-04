import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pafee_app/Application/provider/pafee_provider.dart';

// class StartButton extends ConsumerWidget {
//   const StartButton({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final timeNotifier = ref.watch(timeNotifierProvider);
//     final feeNotifier = ref.watch(feeNotifierProvider);
//     final maximumFeeNotifier = ref.watch(maximumFeeNotifierProvider);
//     final maximumTimeNotifier = ref.watch(maximumTimeNotifierProvider);
//     final changeContainerNotifier = ref.watch(changeContainerNotifierProvider);
//     int isTime = int.parse(timeNotifier);
//     //  * 60;
//     return ElevatedButton(
//       onPressed: () {
//         HapticFeedback.vibrate();
//         if (changeContainerNotifier == true) {
//           final changeNotifier =
//               ref.read(changeContainerNotifierProvider.notifier);
//           changeNotifier.changeFalse();
//           final notifier = ref.read(updateFeeNotifierProvider.notifier);
//           notifier.updateState(
//               isTime,
//               int.parse(feeNotifier),
//               int.parse(maximumTimeNotifier),
//               int.parse(maximumFeeNotifier),
//               ref.watch(changeContainerNotifierProvider));
//         } else {
//           final changeNotifier =
//               ref.read(changeContainerNotifierProvider.notifier);
//           changeNotifier.changeTrue();
//           final notifier = ref.read(updateFeeNotifierProvider.notifier);
//           notifier.updateState(
//               isTime,
//               int.parse(feeNotifier),
//               int.parse(maximumTimeNotifier),
//               int.parse(maximumFeeNotifier),
//               ref.watch(changeContainerNotifierProvider));
//         }
//       },
//       child: const Text("開始"),
//     );
//   }
// }
