/*
 * @Description: 带颜色填充的输入框
 * @Author: iamsmiling
 * @Date: 2021-04-19 10:21:02
 * @LastEditTime: 2021-04-22 17:42:37
 */
import 'package:flutter/material.dart';

class FilledTextField extends StatefulWidget {
  final Color? fillColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final BorderRadius? borderRadius;
  final InputDecoration inputDecoration;
  final int? maxLength;
  final int? maxLines;
  final TextStyle? countStyle;
  final BoxConstraints? constraints;
  final double? width;
  final double? height;
  const FilledTextField({
    Key? key,
    this.fillColor = const Color(0xFFF5F5F5),
    this.margin,
    this.padding = const EdgeInsets.all(10),
    this.onChanged,
    this.borderRadius = const BorderRadius.all(Radius.circular(7)),
    required this.inputDecoration,
    this.maxLength,
    this.maxLines,
    this.countStyle = const TextStyle(
        color: Color(0xFF999999),
        fontSize: 10,
        fontFamily: "PingFang SC,Heiti SC"),
    this.initialValue,
    this.constraints,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _FilledTextFieldState createState() => _FilledTextFieldState();
}

class _FilledTextFieldState extends State<FilledTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String val) {
    setState(() {
      // ignore: unnecessary_statements
      widget.onChanged != null ? widget.onChanged!(val) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: widget.margin,
        padding: widget.padding,
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        constraints: widget.constraints,
        decoration: BoxDecoration(
          color: widget.fillColor,
          borderRadius: widget.borderRadius,
        ),
        child: TextFormField(
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            initialValue: widget.initialValue,
            controller: _controller,
            onChanged: _onChanged,
            decoration: widget.inputDecoration.copyWith(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isCollapsed: true,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                counterStyle: widget.countStyle,
                counter: widget.maxLength == null
                    ? null
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Spacer(),
                          Text(
                            "${_controller.text.length}/${widget.maxLength}",
                            style: widget.countStyle,
                          ),
                          Text(
                            "字",
                            style: widget.countStyle!.copyWith(fontSize: 9),
                          ),
                        ],
                      ))));
  }
}
