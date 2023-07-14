import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pafee_app/presentation/widgets/end_alert.dart';

class ResultButton extends StatelessWidget {
  const ResultButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const EndAlert();
              });
        },
        child: Text('計算終了'));
  }
}
