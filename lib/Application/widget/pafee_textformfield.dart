import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/pafee_provider.dart';

class PafeeTextFormField extends ConsumerWidget {
  final String hint;
  final IconData icon;
  const PafeeTextFormField({super.key, required this.hint, required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: width / 2,
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (String? value) {
            switch (hint) {
              case "料金":
                if (value?.isEmpty == true) {
                  final notifier = ref.read(feeNotifierProvider.notifier);
                  notifier.save('0');
                } else {
                  final notifier = ref.read(feeNotifierProvider.notifier);
                  notifier.save(value!);
                }
                break;
              case "加算される時間":
                if (value?.isEmpty == true) {
                  final notifier = ref.read(timeNotifierProvider.notifier);
                  notifier.save('0');
                } else {
                  final notifier = ref.read(timeNotifierProvider.notifier);
                  notifier.save(value!);
                }
                break;
              case "最大料金":
                if (value?.isEmpty == true) {
                  final notifier =
                      ref.read(maximumFeeNotifierProvider.notifier);
                  notifier.save('0');
                }
                final notifier = ref.read(maximumFeeNotifierProvider.notifier);
                notifier.save(value!);
                break;
              case "最大時間":
                if (value?.isEmpty == true) {
                  final notifier =
                      ref.read(maximumTimeNotifierProvider.notifier);
                  notifier.save('0');
                } else {
                  final notifier =
                      ref.read(maximumTimeNotifierProvider.notifier);
                  notifier.save(value!);
                }
                break;
            }
          },
          decoration: InputDecoration(
            //TextFormFieldの形を変える
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10), //TextFormFieldの高さを設定
            hintText: hint, //TextFormFieldのアシストテキストの設定
            prefixIcon: Icon(
              icon, //アイコンの指定
            ),
            border: const OutlineInputBorder(), //TextFormFieldの外枠を作る
          ),
        ),
      ),
    );
  }
}
