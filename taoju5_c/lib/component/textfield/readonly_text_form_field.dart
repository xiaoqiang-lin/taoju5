/*
 * @Description: 只读的textfield
 * @Author: iamsmiling
 * @Date: 2021-05-06 15:47:29
 * @LastEditTime: 2021-05-07 14:32:48
 */
import 'package:flutter/material.dart';

class ReadOnlyTextFormField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final String? initialValue;
  final Function()? onTap;
  const ReadOnlyTextFormField(
      {Key? key,
      this.hintText,
      this.hintStyle,
      this.suffixIcon,
      this.initialValue,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      child: TextFormField(
        readOnly: true,
        onTap: onTap,
        style: TextStyle(fontSize: 14, color: Color(0xff333333)),
        initialValue: initialValue,
        textAlign: TextAlign.right,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            // isCollapsed: true,
            suffixIconConstraints: BoxConstraints(maxHeight: 24, minWidth: 14),
            suffixIcon: IconTheme(
              data: IconThemeData(size: 12),
              child: Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.only(top: 7),
                constraints: BoxConstraints(maxHeight: 12, maxWidth: 12),
                alignment: Alignment.centerRight,
                child: suffixIcon ?? Image.asset("resources/images/next.png"),
                // onPressed: () {},
                // iconSize: 12,
              ),
            )),
      ),
    );
  }
}
