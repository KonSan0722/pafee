import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pafee_app/Application/state/pafee_provider.dart';
import 'package:pafee_app/presentation/pages/result_page.dart';

class EndAlert extends ConsumerWidget {
  const EndAlert({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: const Center(
        child: Text(
          '計算を終了しますか？',
          style: TextStyle(fontSize: 20),
        ),
      ),
      buttonPadding: const EdgeInsets.all(50),
      actions: <Widget>[
        GestureDetector(
          child: const Center(
              child: Text(
            '終了',
            style: TextStyle(fontSize: 30),
          )),
          onTap: () {
            final notifier = ref.read(stopTimerNotifierProvider.notifier);
            notifier.change();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ResultPage()),
            );
          },
        ),
        GestureDetector(
          child: const Center(
              child: Text(
            '戻る',
            style: TextStyle(fontSize: 30),
          )),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
