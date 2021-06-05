/*
 * @Description: 尺寸固定的输入框
 * @Author: iamsmiling
 * @Date: 2021-05-10 16:31:19
 * @LastEditTime: 2021-05-29 17:10:35
 */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';

class SizedTextField extends StatefulWidget {
  final InputDecoration decoration;
  final BoxDecoration? boxDecoration;
  final Function(String)? onChanged;
  final BoxConstraints? constraints;
  final String? initialValue;
  final ShakeAnimationController? shakeController;
  final Color borderColor;
  final Color hintColor;
  final TextAlign textAlign;
  final EdgeInsets padding;

  const SizedTextField(
      {Key? key,
      required this.decoration,
      this.boxDecoration,
      this.onChanged,
      this.constraints,
      this.initialValue,
      this.shakeController,
      this.borderColor = const Color(0xFFEE9B5F),
      this.hintColor = const Color(0xFFBCBCBC),
      this.textAlign = TextAlign.center,
      this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  _SizedTextFieldState createState() => _SizedTextFieldState();
}

class _SizedTextFieldState extends State<SizedTextField> {
  late String? _initialValue;

  @override
  void initState() {
    super.initState();
    _initialValue = widget.initialValue;
    if (_initialValue != null) {
      if (_initialValue!.contains(".0")) {
        _initialValue =
            _initialValue!.substring(0, _initialValue!.indexOf(".0"));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShakeAnimationWidget(
      isForward: false,
      shakeAnimationController: widget.shakeController,
      shakeAnimationType: ShakeAnimationType.LeftRightShake,
      child: Container(
        alignment: Alignment.center,
        padding: widget.padding,
        constraints: widget.constraints ??
            BoxConstraints(maxHeight: 32, maxWidth: 84, minHeight: 32),
        decoration: widget.boxDecoration ??
            BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: widget.borderColor)),
        child: TextFormField(
            onChanged: widget.onChanged,
            maxLines: 1,
            initialValue: _initialValue,
            maxLengthEnforcement:
                MaxLengthEnforcement.truncateAfterCompositionEnds,
            buildCounter: null,
            textAlign: widget.textAlign,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(fontSize: 12, color: Color(0xFFEE9B5F)),

            // suffixIcon: Image.asset("resources/images/clear.png"),
            decoration: widget.decoration.copyWith(
                border: InputBorder.none,
                isCollapsed: true,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                // counter: SizedBox.shrink(),
                hintStyle: TextStyle(fontSize: 12, color: widget.hintColor))),
      ),
    );
  }
}
