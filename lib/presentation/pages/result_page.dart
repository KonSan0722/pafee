import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pafee_app/Application/state/pafee_provider.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultFee = ref.watch(updateFeeNotifierProvider);
    return Scaffold(
      body: Text("駐車料金は$resultFeeです。"),
    );
  }
}
