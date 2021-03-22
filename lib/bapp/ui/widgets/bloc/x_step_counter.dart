/*
 * @Description: 计数器
 * @Author: iamsmiling
 * @Date: 2021-01-15 17:44:47
 * @LastEditTime: 2021-01-15 18:01:26
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:get/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class XStepCounter extends StatefulWidget {
  // 输入框内容改变
  final ValueChanged<String> onValueChange;
  final int initialValue;
  final double width;
  final double height;
  const XStepCounter({
    Key key,
    @required this.onValueChange,
    this.initialValue = 1,
    this.width = 128,
    this.height = 32,
  }) : super(key: key);

  @override
  _XStepCounterState createState() => _XStepCounterState();
}

class _XStepCounterState extends State<XStepCounter> {
  ValueChanged<String> get onValueChange => widget.onValueChange;

  TextEditingController controller;
  int value = 1;

  @override
  void initState() {
    value = widget.initialValue;
    controller = TextEditingController(text: "$value");
    super.initState();
  }

  void onPlus() {
    value += 1;
    controller.text = "$value";
    onValueChange("$value");
  }

  void onSubstract() {
    if (value <= 1) {
      return;
    }
    value -= 1;
    controller.text = "$value";
    onValueChange("$value");
  }

  void onChange(String val) {
    if (GetUtils.isNum(val)) {
      value = int.parse(val);
      onValueChange("$value");
    } else {
      EasyLoading.showInfo("请输入正确的数值哦");
      setState(() {
        value = 1;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: BColors.inputBorderColor)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: onSubstract,
              child: Container(
                child: Image.asset("assets/images/substract.png"),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                height: 36,
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: BColors.inputBorderColor),
                        left: BorderSide(color: BColors.inputBorderColor))),
                child: TextFormField(
                  maxLines: 1,
                  controller: controller,
                  onChanged: onChange,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(isCollapsed: true),
                ),
              )),
          // XSizedTextField(
          //   // width: 96,
          //   width: 56,
          //   onChanged: onChange,
          // ),
          Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: onPlus,
                child: Container(
                  child: Image.asset("assets/images/plus.png"),
                )),
          ),
        ],
      ),
    );
  }
}
