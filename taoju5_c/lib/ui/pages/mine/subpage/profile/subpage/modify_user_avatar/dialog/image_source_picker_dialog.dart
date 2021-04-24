/*
 * @Description: 选择图片来源对话框
 * @Author: iamsmiling
 * @Date: 2021-04-22 13:48:07
 * @LastEditTime: 2021-04-22 13:58:32
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:image_picker/image_picker.dart';

Future<ImageSource?> openImageSourcePickerDialog(BuildContext context) {
  return showDialog<ImageSource?>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(ImageSource.camera),
                  child: Text(
                    "拍照",
                    style: TextStyle(
                        fontSize: R.dimen.sp14, color: R.color.ff333333),
                  )),
              Divider(endIndent: R.dimen.dp15, indent: R.dimen.dp15),
              TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(ImageSource.gallery),
                  child: Text(
                    "从手机相册选择",
                    style: TextStyle(
                        fontSize: R.dimen.sp14, color: R.color.ff333333),
                  )),
              Divider(endIndent: R.dimen.dp15, indent: R.dimen.dp15),
              TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text(
                    "取消",
                    style: TextStyle(
                        fontSize: R.dimen.sp14, color: R.color.ff333333),
                  )),
            ],
          ),
        );
      });
}
