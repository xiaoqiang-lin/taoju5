/*
 * @Description: 圆形checkbox
 * @Author: iamsmiling
 * @Date: 2021-04-16 09:59:55
 * @LastEditTime: 2021-04-17 17:41:36
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class CRoundCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  CRoundCheckbox({Key key, @required this.value, @required this.onChanged})
      : assert(value != null, "please provide a initial value"),
        assert(onChanged != null,
            "please provide a action when the value changed"),
        super(key: key);

  @override
  _CRoundCheckBoxState createState() => _CRoundCheckBoxState();
}

class _CRoundCheckBoxState extends State<CRoundCheckbox> {
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
      child: Image.asset(_isChecked ? R.image.checked : R.image.unchecked),
    );
  }
}
