/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-16 14:24:25
 * @LastEditTime: 2021-04-19 10:19:43
 */
import 'package:flutter/material.dart';

class FixedLabelTextField extends StatelessWidget {
  final String label;
  final TextStyle labelStyle;
  final BoxConstraints constraints;
  const FixedLabelTextField(
      {Key? key,
      required this.label,
      this.labelStyle = const TextStyle(fontSize: 13, color: Color(0xFF333333)),
      this.constraints =
          const BoxConstraints(minWidth: 72, maxWidth: 72, minHeight: 24)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: constraints,
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        child: Text(label, style: labelStyle));
  }
}
