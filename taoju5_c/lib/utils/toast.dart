/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-06 10:40:06
 * @LastEditTime: 2021-05-26 16:47:41
 */

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

abstract class ToastKit {
  static init() {
    EasyLoading.instance.successWidget =
        Image.asset("resources/images/success.png");
    EasyLoading.instance.errorWidget =
        Image.asset("resources/images/failure.png");
    // EasyLoading.instance.backgroundColor = Colors.white;
    // EasyLoading.instance.maskColor = Colors.white;
    // EasyLoading.instance.indicatorColor = Colors.white;
  }

  static success(String message) {
    // init();
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            // contentPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("resources/images/success.png"),
                Container(
                  margin: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
        });
    Future.delayed(const Duration(milliseconds: 1000)).whenComplete(Get.back);
    // EasyLoading.showSuccess(message);
  }

  static warning(String message) {
    EasyLoading.showInfo(message);
  }

  static loading(
      {String? message,
      EasyLoadingMaskType maskType = EasyLoadingMaskType.none}) {
    EasyLoading.show(status: message, maskType: maskType);
  }

  static dismiss({Duration? delay}) {
    if (!EasyLoading.isShow) return;
    EasyLoading.dismiss();
  }

  static error(String message, {bool autoDismiss = false}) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            // contentPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("resources/images/failure.png"),
                Container(
                  margin: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
        });
    if (autoDismiss) {
      Future.delayed(const Duration(milliseconds: 1000)).whenComplete(Get.back);
    }
  }
}
