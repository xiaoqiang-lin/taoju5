/*
 * @Description:定金对话框
 * @Author: iamsmiling
 * @Date: 2021-01-11 15:51:59
 * @LastEditTime: 2021-01-11 16:05:34
 */

import 'package:flutter/material.dart';

Future showDepositDialog(BuildContext context, {String initialValue}) {
  return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return _DepositDialog(initialValue: initialValue);
      });
}

class _DepositDialog extends StatefulWidget {
  final String initialValue;

  const _DepositDialog({Key key, this.initialValue}) : super(key: key);

  @override
  __DepositDialogState createState() => __DepositDialogState();
}

class __DepositDialogState extends State<_DepositDialog> {
  String _value;

  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "定金",
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: TextFormField(
              initialValue: widget.initialValue,
              keyboardType: TextInputType.number,
              autofocus: true,
              onChanged: (String text) {
                _value = text;
              },
              decoration: InputDecoration(
                  filled: true,
                  hintText: '元',
                  fillColor: const Color(0xFFF2F2F2),
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("取消"),
              ),
              SizedBox(
                width: 24,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(_value),
                  child: Text("确定"))
            ],
          )
        ],
      ),
    );
  }
}
