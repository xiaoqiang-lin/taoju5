/*
 * @Description: 性别选择器
 * @Author: iamsmiling
 * @Date: 2021-01-11 09:58:14
 * @LastEditTime: 2021-01-11 13:28:48
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/constants/x_gender.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_bottom_sheet_picker.dart';

Future showGenderPicker(BuildContext context,
    {XGender defaultGender = XGender.unknown}) {
  return showCupertinoModalPopup<XGender>(
      context: context,
      semanticsDismissible: false,
      builder: (BuildContext context) {
        return _XGenderPickerView(
          defaultGender: defaultGender,
        );
      });
}

class _XGenderPickerView extends StatefulWidget {
  final XGender defaultGender;
  final double itemExtent;

  _XGenderPickerView({
    Key key,
    this.defaultGender = XGender.unknown,
    this.itemExtent = 48.0,
  }) : super(key: key);

  @override
  _XGenderPickerViewState createState() => _XGenderPickerViewState();
}

class _XGenderPickerViewState extends State<_XGenderPickerView> {
  FixedExtentScrollController _controller;

  @override
  void initState() {
    _controller =
        FixedExtentScrollController(initialItem: widget.defaultGender.index);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  XGender gender;

  onSelectedItemChanged(int i) {
    gender = XGender.values[i];
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetPicker(
      onConfirm: () => Navigator.of(context).pop(gender),
      child: CupertinoPicker(
        scrollController: _controller,
        onSelectedItemChanged: onSelectedItemChanged,
        itemExtent: widget.itemExtent,
        children: XGender.values
            .map((e) => Center(child: Text(getGenderName(e))))
            ?.toList(),
      ),
    );
  }
}
