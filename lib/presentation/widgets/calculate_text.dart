import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pafee_app/presentation/widgets/kosugimaru_text.dart';

import '../../Application/state/pafee_provider.dart';

class CalculateText extends ConsumerWidget {
  const CalculateText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateFeeNotifier = ref.watch(updateFeeNotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const KosugimaruText(comment: "現在の料金は...", size: 10),
        KosugimaruText(comment: "$updateFeeNotifier円です。", size: 30)
      ],
    );
  }
}
