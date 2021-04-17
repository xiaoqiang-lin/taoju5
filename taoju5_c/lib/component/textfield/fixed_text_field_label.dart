/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-16 14:24:25
 * @LastEditTime: 2021-04-16 14:42:32
 */
import 'package:flutter/material.dart';

class CFixedTextFieldLabel extends StatelessWidget {
  final String label;
  final TextStyle labelStyle;
  final BoxConstraints constraints;
  const CFixedTextFieldLabel(
      {Key key,
      @required this.label,
      this.labelStyle = const TextStyle(fontSize: 13, color: Color(0xFF333333)),
      this.constraints =
          const BoxConstraints(minWidth: 72, maxWidth: 72, minHeight: 24)})
      : assert(label != null, "label could not be null"),
        assert(constraints != null, "constraints could not be null"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: constraints,
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        child: Text(label, style: labelStyle));
  }
}
