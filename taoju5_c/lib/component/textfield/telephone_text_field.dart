/*
 * @Description: 电话号码输入框封装
 * @Author: iamsmiling
 * @Date: 2021-04-14 14:05:35
 * @LastEditTime: 2021-04-17 16:42:12
 */
import 'package:flutter/material.dart';

import 'clearable_text_field.dart';

class TelephoneTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hintText;
  final String errorText;

  ///是否开启错误提示
  final bool enabledErrorHint;
  const TelephoneTextField(
      {Key? key,
      this.onChanged,
      this.hintText = "请输入手机号",
      this.errorText = "手机号错误",
      this.enabledErrorHint = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClearableTextField(
      onChanged: onChanged,
      suffixIcon: Image.asset("resources/images/clear.png"),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: hintText, errorText: enabledErrorHint ? errorText : null
          // errorText: "手机号输入错误",
          ),
    );
  }
}
