import 'package:flutter/material.dart';

enum TabItem {
  timeFee(
      title: "加算される料金と時間",
      feeComment: "料金",
      timeComment: "加算される時間",
      feeIcon: Icons.attach_money_sharp,
      timeIcon: Icons.av_timer),

  maximumFee(
      title: "最大料金と最大時間",
      feeComment: "最大料金",
      timeComment: "最大時間",
      feeIcon: Icons.attach_money_sharp,
      timeIcon: Icons.av_timer);

  const TabItem(
      {required this.title,
      required this.feeComment,
      required this.timeComment,
      required this.feeIcon,
      required this.timeIcon});

  final String title;
  final String feeComment;
  final String timeComment;
  final IconData feeIcon;
  final IconData timeIcon;
}
