/*
 * @Description: 大小固定的输入框
 * @Author: iamsmiling
 * @Date: 2021-01-14 16:06:30
 * @LastEditTime: 2021-02-01 16:31:45
 */

import 'package:flutter/material.dart';

class XSizedTextField extends StatefulWidget {
  final double height;
  final double width;

  final String initialValue;
  final FocusNode focusNode;
  final TextEditingController controller;
  // 输入框点击
  final VoidCallback onTap;

  // 单独清除输入框内容
  final VoidCallback onClear;

  // 清除输入框内容并取消输入
  final VoidCallback onCancel;

  final String hintText;

  final Color fillColor;

  // 输入框内容改变
  final ValueChanged<String> onChanged;
  final bool autoFocus;
  // 搜索框后缀组件
  final Widget suffix;
  final BorderRadius borderRadius;
  const XSizedTextField(
      {Key key,
      this.height,
      this.width,
      this.initialValue,
      this.focusNode,
      this.controller,
      this.onTap,
      this.onClear,
      this.onCancel,
      this.onChanged,
      this.autoFocus = false,
      this.suffix,
      this.hintText,
      this.fillColor = const Color(0xFFF8F8FB),
      this.borderRadius = const BorderRadius.all(Radius.circular(8))})
      : super(key: key);

  @override
  _XSizedTextFieldState createState() => _XSizedTextFieldState();
}

class _XSizedTextFieldState extends State<XSizedTextField> {
  TextEditingController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    if (widget.initialValue != null) _controller.text = widget.initialValue;
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode?.dispose();
    super.dispose();
  }

  // 清除输入框内容
  void _onClearInput() {
    setState(() {
      _controller.clear();
    });
    if (widget.onClear != null) widget.onClear();
  }

  void _onInputChanged(String value) {
    setState(() {});
    if (widget.onChanged != null) widget.onChanged(value);
  }

  Widget _suffix() {
    if (_controller.text.isNotEmpty) {
      return GestureDetector(
        onTap: _onClearInput,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(
            Icons.cancel,
            size: 22,
            color: const Color(0xFFCCCCCC),
          ),
        ),
      );
    }
    return widget.suffix ?? SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        margin: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
            color: widget.fillColor, borderRadius: widget.borderRadius),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: _onInputChanged,
                autofocus: widget.autoFocus,
                focusNode: _focusNode,
                controller: _controller,
                onTap: widget.onTap,
              ),
            ),
            _suffix()
          ],
        ));
  }
}
