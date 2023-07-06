import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Application/state/pafee_provider.dart';

class PreparationText extends ConsumerWidget {
  const PreparationText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeNotifier = ref.watch(timeNotifierProvider);
    final feeNotifier = ref.watch(feeNotifierProvider);
    final maximumFeeNotifier = ref.watch(maximumFeeNotifierProvider);
    final maximumTimeNotifier = ref.watch(maximumTimeNotifierProvider);
    return Container(
        child: Column(
      children: [
        Text("$timeNotifier分で$feeNotifier円加算され、"),
        Text("$maximumTimeNotifier分で最大料金$maximumFeeNotifier円となります。"),
        const Text("お間違い無かったでしょうか？")
      ],
    ));
  }
}
