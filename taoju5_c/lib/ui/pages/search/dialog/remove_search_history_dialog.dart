/*
 * @Description: 移除搜索项
 * @Author: iamsmiling
 * @Date: 2021-05-24 17:17:28
 * @LastEditTime: 2021-07-15 11:02:47
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';

Future openRemoveSearchHistoryDialog(BuildContext context,
    {required Function(String) onRemove, required String value}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.only(top: R.dimen.dp27, bottom: R.dimen.dp20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: R.dimen.dp24),
                  child: Text(
                    "确定要删除这1条搜索记录吗？",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: R.dimen.sp15,
                        color: R.color.ff1b1b1b,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      text: "取消",
                      onPressed: Navigator.of(context).pop,
                      size: PrimaryButtonSize.middle,
                      mode: PrimaryButtonMode.outlinedButton,
                      margin: EdgeInsets.only(right: R.dimen.dp10),
                    ),
                    PrimaryButton(
                      text: "删除",
                      onPressed: () {
                        onRemove(value);
                      },
                      size: PrimaryButtonSize.middle,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}

Future openClearSearchHistoryDialog(BuildContext context,
    {required Function()? onEmpty}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.only(top: R.dimen.dp27, bottom: R.dimen.dp20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: R.dimen.dp24),
                  child: Text(
                    "确定要清除所有搜索记录吗？",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: R.dimen.sp15,
                        color: R.color.ff1b1b1b,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      text: "取消",
                      onPressed: Navigator.of(context).pop,
                      size: PrimaryButtonSize.middle,
                      mode: PrimaryButtonMode.outlinedButton,
                      margin: EdgeInsets.only(right: R.dimen.dp10),
                    ),
                    PrimaryButton(
                      text: "删除",
                      onPressed: onEmpty,
                      size: PrimaryButtonSize.middle,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}
