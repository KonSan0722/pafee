import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pafee_app/presentation/widgets/pafee_textformfield.dart';

class PafeeContainer extends StatelessWidget {
  final feeHintText;
  final feeImageIcon;
  final timeHintText;
  final timeImageIcon;
  final String comment;
  const PafeeContainer(
      {super.key,
      required this.comment,
      required this.feeHintText,
      required this.feeImageIcon,
      required this.timeHintText,
      required this.timeImageIcon});
  @override
  Widget build(BuildContext context) {
    Color textColor = const Color.fromARGB(255, 123, 123, 123);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Container(
          alignment: Alignment.center,
          height: height / 10 * 3,
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 232, 232, 232)),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(254, 254, 254, 1),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 57, 57, 55),
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: Offset(10, 1))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      PafeeTextFormField(hint: feeHintText, icon: feeImageIcon),
                      Text(
                        "円",
                        style: TextStyle(fontSize: 20, color: textColor),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      PafeeTextFormField(
                          hint: timeHintText, icon: timeImageIcon),
                      Text(
                        '分',
                        style: TextStyle(fontSize: 20, color: textColor),
                      )
                    ],
                  )
                ],
              ),
              Text(
                comment,
                style: TextStyle(fontSize: 20, color: textColor),
              )
            ],
          ),
        ));
  }
}
