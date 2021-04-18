/*
 * @Description: 密码输入框
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-04-18 08:34:23
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class PasswordTextField extends StatefulWidget {
  final bool isPasswordVisible;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final BoxConstraints constraints;
  const PasswordTextField(
      {Key? key,
      this.isPasswordVisible = false,
      this.onChanged,
      this.controller,
      this.constraints = const BoxConstraints(maxHeight: 36)})
      : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late bool _isPasswordVisible;

  @override
  void initState() {
    _isPasswordVisible = widget.isPasswordVisible;
    super.initState();
  }

  _switchPasswordMode() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: widget.constraints,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        onChanged: widget.onChanged,
        controller: widget.controller,
        obscureText: _isPasswordVisible,
        obscuringCharacter: "*",
        decoration: InputDecoration(
            hintText: "请输入密码",
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerRight,
              onPressed: _switchPasswordMode,
              icon: Image.asset(
                  _isPasswordVisible ? R.image.eyeClose : R.image.eyeOpen),
            )),
      ),
    );
  }
}
