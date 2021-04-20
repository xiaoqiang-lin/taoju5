/*
 * @Description: 选择图片来源
 * @Author: iamsmiling
 * @Date: 2021-04-19 13:44:55
 * @LastEditTime: 2021-04-19 13:53:20
 */
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:image_picker/image_picker.dart';

Future<ImageSource?> chooseImageSourceModal(BuildContext context) {
  return showModalBottomSheet<ImageSource?>(
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Column(
            children: [
              TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(ImageSource.camera),
                  child: Text("拍照")),
              TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(ImageSource.gallery),
                  child: Text("相册")),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("取消"))
            ],
          ),
        );
      });
}
