/*
 * @Description: 计数器
 * @Author: iamsmiling
 * @Date: 2021-01-15 17:44:47
 * @LastEditTime: 2021-01-15 18:01:26
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_sized_text_field.dart';

class XStepCounter extends StatelessWidget {
  // 输入框内容改变
  final ValueChanged<String> onChanged;
  final Function onSubstract;
  final Function onPlus;
  const XStepCounter(
      {Key key,
      @required this.onChanged,
      @required this.onSubstract,
      @required this.onPlus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: onSubstract,
            icon: Text(
              "-",
              style: TextStyle(fontSize: 36),
            ),
          ),
          XSizedTextField(
            width: 96,
            onChanged: onChanged,
          ),
          IconButton(
            onPressed: onPlus,
            icon: Text("+", style: TextStyle(fontSize: 36)),
          ),
        ],
      ),
    );
  }
}
