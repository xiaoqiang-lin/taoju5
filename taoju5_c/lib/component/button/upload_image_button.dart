/*
 * @Description: 上传图片按钮
 * @Author: iamsmiling
 * @Date: 2021-04-19 11:37:51
 * @LastEditTime: 2021-04-22 14:22:42
 */
import 'package:flutter/material.dart';

class UploadImageButton extends StatelessWidget {
  final Function()? onPressed;
  const UploadImageButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
          maxHeight: 56, minHeight: 56, minWidth: 56, maxWidth: 56),
      onPressed: onPressed,
      icon: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: const Color(0xFFB4B4B4))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("resources/images/camera.png"),
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                "上传照片",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    height: 1, fontSize: 8, color: Color(0xFF999999)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: Text(
                "(最多五张)",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    height: .98, fontSize: 8, color: Color(0xFF999999)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
