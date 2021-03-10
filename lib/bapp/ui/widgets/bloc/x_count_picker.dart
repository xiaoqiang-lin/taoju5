/*
 * @Description: 年龄选择器
 * @Author: iamsmiling
 * @Date: 2021-01-07 21:20:25
 * @LastEditTime: 2021-01-11 13:52:18
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_bottom_sheet_picker.dart';

Future showCountPicker(BuildContext context,
    {String defaultValue = "", @required List<String> optionList}) {
  return showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) {
        return _XCountPickerView(
          defaultValue: defaultValue, optionList: optionList,
          // defaultGender: defaultGender,
        );
      });
}

class _XCountPickerView extends StatefulWidget {
  final double itemExtent;
  final String defaultValue;
  final TextStyle itemTextStyle;
  final List<String> optionList;
  _XCountPickerView({
    Key key,
    this.itemExtent = 50.0,
    this.defaultValue = "",
    this.itemTextStyle,
    @required this.optionList,
  }) : super(key: key);

  @override
  __XCountPickerViewState createState() => __XCountPickerViewState();
}

class __XCountPickerViewState extends State<_XCountPickerView> {
  FixedExtentScrollController _controller;

  @override
  void initState() {
    _controller = FixedExtentScrollController(
        initialItem: _getInitialIndex(widget.defaultValue));
    super.initState();
  }

  int _getInitialIndex(String defaultValue) {
    if (widget.optionList == null) return 0;
    if (widget.optionList.isEmpty) return 0;
    return widget.optionList.indexOf(defaultValue);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  String result;

  _onSelectedItemChanged(int i) {
    result = widget.optionList[i];
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetPicker(
      onConfirm: () => Navigator.of(context).pop(result),
      child: CupertinoPicker(
        onSelectedItemChanged: _onSelectedItemChanged,
        itemExtent: widget.itemExtent,
        scrollController: _controller,
        children: [
          for (String e in widget.optionList)
            Center(
              child: Text("$e"),
            )
        ],
      ),
    );
  }
}
