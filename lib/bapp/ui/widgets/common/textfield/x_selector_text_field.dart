/*
 * @Description: 选择器
 * @Author: iamsmiling
 * @Date: 2021-01-07 21:18:35
 * @LastEditTime: 2021-04-28 14:05:06
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/type_defs/type_defs.dart';

class XSelectorTextField<T> extends StatefulWidget {
  final Widget label;
  final T initialValue;
  final String hintText;
  final TextDirection contentTextTextDirection;
  final StringifyCallback<T> onStringify;
  final FutureCallback<T> onFuture;
  final Function(T value) onValueChange;
  final Widget divider;
  final double height;
  final bool disabled;
  const XSelectorTextField(
      {Key key,
      @required this.label,
      this.initialValue,
      @required this.onFuture,
      this.contentTextTextDirection = TextDirection.rtl,
      this.hintText = "请选择",
      this.onStringify,
      this.onValueChange,
      this.height,
      this.divider = const Divider(
        height: .5,
        thickness: .5,
      ),
      this.disabled = false})
      : super(key: key);

  @override
  _XSelectorTextFieldState<T> createState() => _XSelectorTextFieldState<T>();
}

class _XSelectorTextFieldState<T> extends State<XSelectorTextField<T>> {
  String _value;
  String _stringify(T value) {
    if (widget.onStringify == null) {
      return value?.toString();
    }
    return widget.onStringify(value);
  }

  @override
  void initState() {
    super.initState();

    _value = _stringify(widget.initialValue);
  }

  Future _onTap() {
    return widget.onFuture().then((value) {
      if (value == null) return;
      widget.onValueChange(value);
      setState(() {
        _value = _stringify(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: widget.disabled ? null : _onTap,
            behavior: HitTestBehavior.opaque,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      widget.label,
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          readOnly: true,
                          onTap: widget.disabled ? null : _onTap,
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.top,
                          textDirection: widget.contentTextTextDirection,
                          decoration: InputDecoration(
                            hintText: _value ?? widget.hintText,
                            contentPadding: EdgeInsets.all(0),
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      widget.disabled ? SizedBox.shrink() : Icon(BIcons.next)
                    ],
                  ),
                  widget.divider
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
