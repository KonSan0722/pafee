import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pafee_app/Application/state/pafee_provider.dart';
import 'package:pafee_app/presentation/widgets/next_button.dart';

import '../widgets/pafee_container.dart';
import '../widgets/tab_item.dart';

class PafeePage extends ConsumerWidget {
  const PafeePage({super.key});
  final timeFee = TabItem.timeFee;
  final maximumFee = TabItem.maximumFee;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final _ = ref.watch(feeNotifierProvider);
    final __ = ref.watch(timeNotifierProvider);
    final ___ = ref.watch(maximumFeeNotifierProvider);
    final ____ = ref.watch(maximumTimeNotifierProvider);
    final _____ = ref.watch(changeTextContainerNotifierProvider);
    return MaterialApp(
        theme: ThemeData(
            textTheme:
                GoogleFonts.kosugiMaruTextTheme(Theme.of(context).textTheme)),
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 208, 52),
          body: Center(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('lib/images/pafee.png')),
                PafeeContainer(
                    comment: timeFee.title,
                    feeHintText: timeFee.feeComment,
                    feeImageIcon: timeFee.feeIcon,
                    timeHintText: timeFee.timeComment,
                    timeImageIcon: timeFee.timeIcon),
                const SizedBox(height: 50),
                PafeeContainer(
                    comment: maximumFee.title,
                    feeHintText: maximumFee.feeComment,
                    feeImageIcon: maximumFee.feeIcon,
                    timeHintText: maximumFee.timeComment,
                    timeImageIcon: maximumFee.timeIcon),
                SizedBox(height: height / 50),
                const NextButton(),
                SizedBox(
                  height: height / 50,
                )
              ],
            ),
          )),
        ));
  }
}
