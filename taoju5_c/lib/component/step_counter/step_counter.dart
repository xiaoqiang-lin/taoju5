/*
 * @Description: 计数器
 * @Author: iamsmiling
 * @Date: 2021-04-26 14:51:39
 * @LastEditTime: 2021-05-06 13:54:44
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class StepCounter extends StatefulWidget {
  final int initialValue;
  final Widget? substractIcon;
  final Widget? plusIcon;
  final int minValue;
  final int maxValue;
  final Function(int) onChanged;
  final double width;
  final double height;
  const StepCounter(
      {Key? key,
      this.initialValue = 1,
      this.substractIcon,
      this.plusIcon,
      this.minValue = 1,
      this.maxValue = 999,
      this.width = 100,
      this.height = 28,
      required this.onChanged})
      : super(key: key);

  @override
  _StepCounterState createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _onChanged(String val) {
    if (!(num.tryParse(val) is num)) {
      _value = widget.minValue;
      return;
    }
    _value = int.parse(val);
    widget.onChanged(_value);
    //
  }

  void _onSubstract() {
    if (_value <= widget.minValue) {
      _value = widget.minValue;
      return;
    }
    setState(() {
      _value--;
      widget.onChanged(_value);
    });
  }

  void _onPlus() {
    if (_value >= widget.maxValue) {
      _value = widget.maxValue;
      return;
    }
    setState(() {
      _value++;
      widget.onChanged(_value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: const Color(0xFFB5B5B5))),
      child: Row(
        children: [
          GestureDetector(
            onTap: _onSubstract,
            child: widget.substractIcon != null
                ? widget.substractIcon
                : Container(
                    width: .28 * widget.width,
                    height: widget.height,
                    padding: EdgeInsets.all(7),
                    child: Image.asset(R.image.substract),
                  ),
          ),
          Flexible(
              child: Container(
            alignment: Alignment.center,
            width: .44 * widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(color: const Color(0xFFB5B5B5)),
                    left: BorderSide(color: const Color(0xFFB5B5B5)))),
            child: TextFormField(
              textAlign: TextAlign.center,
              key: ValueKey(_value),
              initialValue: "$_value",
              onChanged: _onChanged,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          )),
          GestureDetector(
            onTap: _onPlus,
            child: widget.plusIcon != null
                ? widget.plusIcon
                : Container(
                    width: .28 * widget.width,
                    height: widget.height,
                    child: Image.asset(R.image.plus)),
          ),
        ],
      ),
    );
  }
}
