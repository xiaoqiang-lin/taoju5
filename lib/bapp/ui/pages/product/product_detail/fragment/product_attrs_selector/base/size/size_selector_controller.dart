/*
 * @Description: 尺寸
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:49:01
 * @LastEditTime: 2021-02-01 17:09:21
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_mainfest_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_mixin_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/design_product_modal/design_product_modal_controller.dart';
import 'package:taoju5/utils/common_kit.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
    if (Get.arguments != null && Get.arguments is ProductMainfestModel) {
      ProductMixinModel product = Get.arguments;
      width = "${product.width}";
      height = "${product.height}";
      deltaY = product.deltaY;
    }
    super.onInit();
  }

  @override
  void onClose() {
    widthController?.dispose();
    heightController?.dispose();
    deltaYController?.dispose();
    super.onClose();
  }

  void setValue(String val) {
    if (!GetUtils.isNum(val)) {
      EasyLoading.showInfo("请输入正确的数值哦");
    }
  }

  void setWH() {
    width = widthController?.text;
    height = heightController?.text;
    Get.back();
  }

  void setDeltaY() {
    deltaY = deltaYController?.text;
  }

  void initWithMeasureData(OrderMeasureDataModel measureData) {
    width = measureData.width;
    height = measureData.height;
    deltaY = measureData.newDeltaY;
    hasChecked = true;
    update(["size"]);
  }

  void confirm() {
    width = widthController?.text;
    height = heightController?.text;
    deltaY = deltaYController?.text;
    hasChecked = true;
    print(Get.arguments != null && Get.arguments is ProductMixinModel);
    if (Get.arguments != null && Get.arguments is ProductMixinModel) {
      ProductMixinModel product = Get.arguments;
      product.width = widthCM;
      product.height = heightCM;
      product.deltaY = deltaY;
      Get.find<DesignProductModalController>().update();
    }
    update(["size"]);
  }
}
