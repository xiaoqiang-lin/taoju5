/*
 * @Description: 电话号码输入框封装
 * @Author: iamsmiling
 * @Date: 2021-04-14 14:05:35
 * @LastEditTime: 2021-04-15 17:56:42
 */
import 'package:flutter/material.dart';

import 'clearable_text_field.dart';

class TelephoneTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  const TelephoneTextField({Key key, this.onChanged, this.hintText = "请输入手机号"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClearableTextField(
      onChanged: onChanged,
      suffixIcon: Image.asset("resources/images/clear.png"),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: hintText,
        // errorText: "手机号输入错误",
      ),
    );
  }
}
