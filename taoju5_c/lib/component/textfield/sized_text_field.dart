/*
 * @Description: 尺寸固定的输入框
 * @Author: iamsmiling
 * @Date: 2021-05-10 16:31:19
 * @LastEditTime: 2021-05-24 10:50:57
 */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';

class SizedTextField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ShakeAnimationWidget(
      isForward: false,
      shakeAnimationController: shakeController,
      shakeAnimationType: ShakeAnimationType.LeftRightShake,
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        constraints: constraints ??
            BoxConstraints(maxHeight: 32, maxWidth: 84, minHeight: 32),
        decoration: boxDecoration ??
            BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: borderColor)),
        child: TextFormField(
            onChanged: onChanged,
            maxLines: 1,
            initialValue: initialValue,
            maxLengthEnforcement:
                MaxLengthEnforcement.truncateAfterCompositionEnds,
            buildCounter: null,
            textAlign: textAlign,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(fontSize: 12, color: Color(0xFFEE9B5F)),

            // suffixIcon: Image.asset("resources/images/clear.png"),
            decoration: decoration.copyWith(
                border: InputBorder.none,
                isCollapsed: true,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                // counter: SizedBox.shrink(),
                hintStyle: TextStyle(fontSize: 12, color: hintColor))),
      ),
    );
  }
}
