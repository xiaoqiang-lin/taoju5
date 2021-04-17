/*
 * @Description: 尺寸
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:49:01
 * @LastEditTime: 2021-02-01 17:09:21
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/order/order_detail_model.dart';
import 'package:taoju5_b/domain/model/product/product_detail_model.dart';
import 'package:taoju5_b/domain/model/product/product_mixin_model.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5_b/ui/pages/product/selectable_product_list/selectable_product_list_controller.dart';
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SizeSelectorController extends GetxController {
  String width;
  String height;
  String deltaY;

  String tag;

  String defaultWidth;
  String defaultHeight;
  SizeSelectorController();

  double get widthCM => CommonKit.asDouble(width);
  double get heightCM => CommonKit.asDouble(height);

  double get widthM => widthCM / 100;

  double get heightM => heightCM / 100;

  bool get isSizeNullOrEmpty =>
      GetUtils.isNullOrBlank(width) || GetUtils.isNullOrBlank(height);

  Map get params => {
        "9": [
          {"name": "宽", "value": defaultWidth ?? widthCM},
          {"name": "高", "value": defaultHeight ?? heightCM}
        ]
      };

  ///测装数据是否已确认
  bool hasChecked = false;

  static const double MAX_HEIGHT = 350.0;

  static const double MAX_WIDTH = 9.9e8;

  TextEditingController widthController;
  TextEditingController heightController;
  TextEditingController deltaYController;

  SelectProductEvent selectProductEvent;

  @override
  void onInit() {
    widthController = TextEditingController();
    heightController = TextEditingController();
    deltaYController = TextEditingController();
    tag = Get.parameters["id"];
    if (Get.arguments != null && Get.arguments is ProductMixinModel) {
      ProductMixinModel product = Get.arguments;
      width = "${product.width}";
      height = "${product.height}";
      deltaY = product.deltaY;
    }
    if (Get.arguments != null && Get.arguments is SelectProductEvent) {
      selectProductEvent = Get.arguments;
    }

    super.onInit();
  }

  @override
  void onClose() {
    // widthController.dispose();
    // heightController.dispose();
    // deltaYController.dispose();
    super.onClose();
  }

  bool isFixedProduct() {
    if (!Get.isRegistered<ProductDetailController>(tag: tag)) return true;
    ProductDetailModel product =
        Get.find<ProductDetailController>(tag: tag).product;
    return product.isFixedHeight ?? true;
  }

  bool validateWidth(String val) {
    if (!GetUtils.isNum(val)) {
      EasyLoading.showInfo("请输入正确的数值哦");
      return false;
    }
    if (CommonKit.asDouble(val) > MAX_WIDTH) {
      EasyLoading.showInfo("宽度不在有效单位内,请输入合法的宽度哦");
      return false;
    }
    return true;
  }

  bool validateHeight(String val) {
    if (GetUtils.isNullOrBlank(val)) {
      EasyLoading.showInfo("高度不能为空哦");
      return false;
    }
    if (!GetUtils.isNum(val)) {
      EasyLoading.showInfo("请输入正确的数值哦");
      return false;
    }

    if (isFixedProduct() && CommonKit.asDouble(val) > MAX_HEIGHT) {
      EasyLoading.showInfo("该商品暂不支持3.5m以上定制哦");
      return false;
    }
    return true;
  }

  void setValue(String val) {
    if (GetUtils.isNullOrBlank(val)) {
      EasyLoading.showInfo("高度不能为空哦");
    }
  }

  void setW(String val) {
    CommonKit.debounce(() {
      validateWidth(val);
    })();
  }

  void setH(String val) {
    CommonKit.debounce(
      () {
        validateHeight(val);
      },
    )();
  }

  void setWH() {
    if (!validateWidth(widthController?.text) ||
        !validateHeight(heightController?.text)) {
      throw false;
    } else {
      width = widthController?.text;
      height = heightController?.text;
      hasChecked = false;
    }
  }

  void setDeltaY() {
    deltaY = deltaYController?.text;
  }

  void initWithMeasureData(OrderMeasureDataModel measureData) {
    width = measureData.width;
    height = measureData.height;
    deltaY = measureData.newDeltaY;
    hasChecked = true;
    Get.find<ProductDetailController>(tag: tag).updateTotalPrice();
    update(["size"]);
  }

  void confirm() {
    setWH();
    // if (Get.arguments != null && Get.arguments is ProductMixinModel) {
    // ProductMixinModel product = Get.arguments;
    // product.width = widthCM;
    // product.height = heightCM;
    // product.deltaY = deltaY;
    // Get.find<DesignProductModalController>().update();
    // }
    update(["size"]);
  }
}
