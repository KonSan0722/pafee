import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {
  final String textMessage;
  const AlertMessage({super.key, required this.textMessage});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Center(
        child: Text(
          textMessage,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      buttonPadding: const EdgeInsets.all(50),
      actions: <Widget>[
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
