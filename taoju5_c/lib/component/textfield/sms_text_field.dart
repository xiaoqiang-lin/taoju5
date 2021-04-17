/*
 * @Description: 验证码输入框封装
 * @Author: iamsmiling
 * @Date: 2021-04-14 15:22:28
 * @LastEditTime: 2021-04-17 17:42:03
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/sms_button.dart';

class SmsTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final BoxConstraints constraints;
  final Function onPressed;
  const SmsTextField(
      {Key key,
      this.onChanged,
      this.controller,
      this.constraints = const BoxConstraints(maxHeight: 36),
      @required this.onPressed})
      : assert(constraints != null),
        assert(
            onPressed != null, "please provide a callback for the smsButton"),
        super(key: key);

  @override
  _SmsTextFieldState createState() => _SmsTextFieldState();
}

class _SmsTextFieldState extends State<SmsTextField> {
  bool enabled = true;
  void _onPressed() {
    widget.onPressed();
    setState(() {
      enabled = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: widget.constraints,
      child: TextField(
        style: TextStyle(fontSize: 12),
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: "请输入验证码",
          suffixIcon: SmsButton(
            onPressed: _onPressed,
          ),
        ),
      ),
    );
  }
}
