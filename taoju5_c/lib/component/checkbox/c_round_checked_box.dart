/*
 * @Description: 圆形checkbox
 * @Author: iamsmiling
 * @Date: 2021-04-16 09:59:55
 * @LastEditTime: 2021-04-29 16:17:33
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class RoundCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget? checkedIcon;
  final Widget? uncheckedIcon;
  RoundCheckbox(
      {Key? key,
      required this.value,
      required this.onChanged,
      this.checkedIcon,
      this.uncheckedIcon})
      : super(key: key);

  @override
  _RoundCheckboxState createState() => _RoundCheckboxState();
}

class _RoundCheckboxState extends State<RoundCheckbox> {
  bool _isChecked = true;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value;
  }

  void _switch() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChanged(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _switch,
        child: _isChecked
            ? widget.checkedIcon == null
                ? Image.asset(R.image.checked)
                : widget.checkedIcon
            : widget.uncheckedIcon == null
                ? Image.asset(R.image.checked)
                : widget.uncheckedIcon);
  }
}
