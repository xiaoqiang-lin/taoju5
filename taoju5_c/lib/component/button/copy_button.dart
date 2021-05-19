/*
 * @Description: 复制按钮
 * @Author: iamsmiling
 * @Date: 2021-05-18 15:03:07
 * @LastEditTime: 2021-05-18 16:04:36
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CopyButton extends StatelessWidget {
  final String content;
  final String successTip;
  const CopyButton({Key? key, required this.content, this.successTip = "复制成功"})
      : super(key: key);

  void _copy() {
    Clipboard.setData(ClipboardData(text: content));
    // ToastKit.success(successTip);
    Get.snackbar("", "",
        duration: Duration(milliseconds: 1500),
        messageText: Text(successTip),
        backgroundColor: Colors.black.withOpacity(.5));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _copy,
      child: Text(
        "复制",
        style: TextStyle(fontSize: 10, color: const Color(0xFFFF5005)),
      ),
    );
  }
}
