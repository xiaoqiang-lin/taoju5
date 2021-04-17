/*
 * @Description:带label的标签
 * @Author: iamsmiling
 * @Date: 2021-01-07 17:29:28
 * @LastEditTime: 2021-01-12 17:49:15
 */

import 'package:flutter/material.dart';

class XLabelTextField extends StatelessWidget {
  final String label;
  final String initialValue;
  final String hintText;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final TextEditingController controller;
  final TextStyle labelStyle;
  final EdgeInsets labelPadding;
  const XLabelTextField(
      {Key key,
      @required this.label,
      this.initialValue,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.controller,
      this.labelStyle = const TextStyle(fontSize: 28),
      this.labelPadding = const EdgeInsets.only(right: 16),
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Container(
              padding: labelPadding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Flexible(child: Text(label))],
              ),
            )),
        initialValue: initialValue,
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        onEditingComplete: onEditingComplete);
  }
}
