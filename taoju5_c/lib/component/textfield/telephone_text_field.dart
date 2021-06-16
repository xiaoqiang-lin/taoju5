/*
 * @Description: 电话号码输入框封装
 * @Author: iamsmiling
 * @Date: 2021-04-14 14:05:35
 * @LastEditTime: 2021-06-07 15:26:22
 */
import 'package:flutter/material.dart';

import 'clearable_text_field.dart';

class TelephoneTextField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String hintText;
  final String errorText;
  final String? initialValue;

  ///是否开启错误提示
  final bool autoValidate;
  const TelephoneTextField({
    Key? key,
    this.onChanged,
    this.hintText = "请输入手机号",
    this.errorText = "手机号错误",
    this.autoValidate = false,
    this.initialValue,
  }) : super(key: key);

  @override
  _TelephoneTextFieldState createState() => _TelephoneTextFieldState();
}

class _TelephoneTextFieldState extends State<TelephoneTextField> {
  @override
  void initState() {
    super.initState();
  }

  void _validate(String? val) {
    if (val == null ||
        RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
                .hasMatch(val) &&
            widget.autoValidate) {
      // setState(() {
      //   _hasError = true;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClearableTextField(
      onChanged: widget.onChanged,
      initialValue: widget.initialValue,
      suffixIcon: Image.asset("resources/images/clear.png"),
      keyboardType: TextInputType.phone,
      onSubmitted: _validate,
      decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.autoValidate ? widget.errorText : null
          // errorText: "手机号输入错误",
          ),
    );
  }
}
