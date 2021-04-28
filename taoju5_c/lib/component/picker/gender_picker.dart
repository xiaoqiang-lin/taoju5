/*
 * @Description: 选择性别
 * @Author: iamsmiling
 * @Date: 2021-04-27 15:06:31
 * @LastEditTime: 2021-04-27 15:24:09
 */

/*
 * @Description: 选择性别弹窗
 * @Author: iamsmiling
 * @Date: 2021-04-19 15:28:33
 * @LastEditTime: 2021-04-27 15:05:20
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:taoju5_c/res/R.dart';

Future<Gender?> openGenderPicker(BuildContext context, {Gender? initialValue}) {
  return showDialog<Gender?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: _ChooseGenderDialog(),
        );
      });
  // return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return _ChooseGenderDialog(
  //         initialValue: initialValue,
  //       );
  //     });
}

class _ChooseGenderDialog extends StatefulWidget {
  final Gender? initialValue;
  _ChooseGenderDialog({Key? key, this.initialValue = Gender.unknow})
      : super(key: key);

  @override
  __ChooseGenderDialogState createState() => __ChooseGenderDialogState();
}

class __ChooseGenderDialogState extends State<_ChooseGenderDialog> {
  late FixedExtentScrollController _fixedExtentScrollController;
  late Gender _value;
  @override
  void initState() {
    super.initState();
    _value = widget.initialValue ?? Gender.unknow;
    _fixedExtentScrollController =
        FixedExtentScrollController(initialItem: _value.index);
  }

  @override
  void dispose() {
    _fixedExtentScrollController.dispose();
    super.dispose();
  }

  void _onSelectedItemChanged(int i) {
    _value = Gender.values[i];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(7), topLeft: Radius.circular(7)),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      height: 196,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: CupertinoPicker.builder(
              childCount: Gender.values.length,
              onSelectedItemChanged: _onSelectedItemChanged,
              itemExtent: 48,
              itemBuilder: (BuildContext context, int i) {
                return Center(
                  child: Text(Gender.values[i].name),
                );
              },
            ),
          ),
          Row(
            children: [
              PrimaryButton(
                text: "取消",
                onPressed: Navigator.of(context).pop,
                mode: PrimaryButtonMode.materialButton,
                size: PrimaryButtonSize.middle,
              ),
              PrimaryButton(
                text: "确定",
                margin: EdgeInsets.only(left: R.dimen.dp10),
                onPressed: () => Navigator.of(context).pop(_value),
                mode: PrimaryButtonMode.elevatedButton,
                size: PrimaryButtonSize.middle,
              )
            ],
          )
        ],
      ),
    );
  }
}
