/*
 * @Description:定金对话框
 * @Author: iamsmiling
 * @Date: 2021-01-11 15:51:59
 * @LastEditTime: 2021-01-11 16:05:34
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

Future<String> showEditDeltaYDialog(BuildContext context,
    {String initialValue}) {
  return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return _EditDeltaYDialog(initialValue: initialValue);
      });
}

class _EditDeltaYDialog extends StatefulWidget {
  final String initialValue;

  const _EditDeltaYDialog({Key key, this.initialValue}) : super(key: key);

  @override
  __EditDeltaYDialogState createState() => __EditDeltaYDialogState();
}

class __EditDeltaYDialogState extends State<_EditDeltaYDialog> {
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
        "离地距离",
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                  hintText: '请输入离地距离',
                  fillColor: const Color(0xFFF2F2F2),
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: BDimens.gap16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          )
        ],
      ),
    );
  }
}
