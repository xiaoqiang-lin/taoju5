/*
 * @Description: 尺寸
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:49:01
 * @LastEditTime: 2021-02-01 17:09:21
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/utils/common_kit.dart';

class SizeSelectorController extends GetxController {
  String width;
  String height;
  String deltaY;

  double get widthCM => CommonKit.asDouble(width);
  double get heightCM => CommonKit.asDouble(height);

  double get widthM => widthCM / 100;

  double get heightM => heightCM / 100;

  bool get isSizeNullOrEmpty =>
      GetUtils.isNullOrBlank(width) || GetUtils.isNullOrBlank(height);

  Map get params => {
        "9": [
          {"name": "宽", "value": widthCM},
          {"name": "高", "value": heightCM}
        ]
      };

  ///测装数据是否已确认
  bool hasChecked = false;

  TextEditingController widthController;
  TextEditingController heightController;
  TextEditingController deltaYController;

  @override
  void onInit() {
    widthController = TextEditingController();
    heightController = TextEditingController();
    deltaYController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // widthController?.dispose();
    // heightController?.dispose();
    // deltaYController?.dispose();
    super.onClose();
  }

  void confirm() {
    width = widthController?.text;
    height = heightController?.text;
    deltaY = deltaYController?.text;
    hasChecked = true;
    update(["size"]);
  }
}
