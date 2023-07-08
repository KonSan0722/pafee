import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Application/state/pafee_provider.dart';
import 'kosugimaru_text.dart';

class PreparationText extends ConsumerWidget {
  const PreparationText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeNotifier = ref.watch(timeNotifierProvider);
    final feeNotifier = ref.watch(feeNotifierProvider);
    final maximumFeeNotifier = ref.watch(maximumFeeNotifierProvider);
    final maximumTimeNotifier = ref.watch(maximumTimeNotifierProvider);
    final changeTextNotifier = ref.watch(changeTextContainerNotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        changeTextNotifier
            ? KosugimaruText(
                comment: "$timeNotifier分で$feeNotifier円加算されます。", size: 15)
            : KosugimaruText(
                comment: "$timeNotifier分で$feeNotifier円加算され、", size: 15),
        changeTextNotifier
            ? Container()
            : KosugimaruText(
                comment: "$maximumTimeNotifier分で最大料金$maximumFeeNotifier円となります。",
                size: 15),
        const KosugimaruText(comment: "お間違い無かったでしょうか？", size: 20)
      ],
    );
  }
}
