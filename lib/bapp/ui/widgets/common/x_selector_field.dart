/*
 * @Description: 选择字段组件
 * @Author: iamsmiling
 * @Date: 2020-12-23 16:42:02
 * @LastEditTime: 2020-12-24 14:18:43
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/interface/i_xvalue_changable.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/type_defs/type_defs.dart';

class XSelectorField<T> extends StatefulWidget {
  final FutureCallback futureCallback;
  final String hint;
  final T initialValue;
  final TextStyle hintTextStyle;
  final ValueWidgetBuilder builder;

  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget child;
  final Color dividerColor;

  ///[value]的样式
  final TextStyle style;
  final Widget trailling;
  const XSelectorField({
    Key key,
    this.futureCallback,
    this.hint,
    this.initialValue,
    this.hintTextStyle,
    this.builder,
    this.padding,
    this.margin,
    this.child,
    this.dividerColor,
    this.style,
    this.trailling = const Icon(BIcons.next),
  }) : super(key: key);

  @override
  _XSelectorFieldState<T> createState() => _XSelectorFieldState<T>();
}

class _XSelectorFieldState<T> extends State<XSelectorField<T>> {
  _onTap() {
    widget.futureCallback().then((value) {
      if (value == null) return;
      if (value is IXValueChangeable) {
        _value = value.value;
        return;
      }
      if (value is DateTime) {
        // _value = (value as DateTime).formatDate(format: "yyyy年MM月dd日");
        return;
      }
      _value = value;
    }).whenComplete(() {
      if (mounted) setState(() {});
    });
  }

  T _value;

  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        // padding:
        //     widget.padding ?? EdgeInsets.symmetric(vertical: BDimens.gap24),
        // margin:
        //     widget.margin ?? EdgeInsets.symmetric(horizontal: BDimens.gap32),
        // decoration: BoxDecoration(
        //     border: Border(
        //         bottom: BorderSide(
        //             color: widget.dividerColor ?? BColors.dividerColor))),
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.hint,
                    // style: widget.hintTextStyle ?? BStyles.inputLabelText,
                  ),
                  Row(
                    children: [Text("$_value"), widget.trailling],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
