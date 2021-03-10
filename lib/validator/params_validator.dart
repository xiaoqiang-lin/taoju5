/*
 * @Description: 参数校验器
 * @Author: iamsmiling
 * @Date: 2020-12-29 10:41:59
 * @LastEditTime: 2021-02-02 09:55:54
 */

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';

abstract class ParamsValidator {
  bool isPhoneNumber(String text, {String message = "请输入正确的手机号"}) {
    if (!GetUtils.isPhoneNumber(text)) {
      EasyLoading.showInfo(message);
      return false;
    }
    return true;
  }

  bool isGenderNull(String text, {String message = "请选择客户性别"}) {
    if (GetUtils.isNullOrBlank(text) || text == "0") {
      EasyLoading.showInfo(message);
      return false;
    }
    return true;
  }

  bool isNullOrBlank(String text, {@required String message}) {
    if (GetUtils.isNullOrBlank(text)) {
      EasyLoading.showInfo(message);
      return false;
    }
    return true;
  }

  bool isPassword(String text, {@required String message, RegExp pattern}) {
    if (GetUtils.isNullOrBlank(text)) {
      EasyLoading.showInfo(message);
      return false;
    }
    if (pattern != null && !pattern.hasMatch(text)) {
      EasyLoading.showInfo(message);
      return false;
    }
    return true;
  }

  ///当前选择的客户是否为空
  Future isCustomerNull({@required Function onSuccess}) {
    bool flag = Get.find<CustomerProviderController>().isCustomerNull;
    if (flag == false) {
      throw EasyLoading.showInfo("请先选择客户哦");
    }
    return Future.value(true);
  }

  bool validate({var flag});
}
