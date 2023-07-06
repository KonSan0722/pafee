import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pafee_app/Application/state/pafee_provider.dart';
import 'package:pafee_app/presentation/widgets/calculate_text.dart';
import 'package:pafee_app/presentation/widgets/preparation_text.dart';

class LoginContainer extends ConsumerWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changeContainerNotifier = ref.watch(changeContainerNotifierProvider);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: AnimatedContainer(
            width: width / 10 * 8,
            height: changeContainerNotifier ? height / 3 : height / 5,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: Offset(10, 1),
                  )
                ]),
            curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 1000),
            child: changeContainerNotifier
                ? const PreparationText()
                : const CalculateText()));
  }
}
