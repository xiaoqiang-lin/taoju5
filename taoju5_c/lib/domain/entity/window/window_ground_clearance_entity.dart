/*
 * @Description: 窗户离地距离
 * @Author: iamsmiling
 * @Date: 2021-05-10 17:59:59
 * @LastEditTime: 2021-05-12 11:30:26
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/utils/toast.dart';

class WindowGroundClearanceEntity {
  late String label;
  double? value;

  WindowGroundClearanceEntity.fromJson(Map json) {
    label = json["label"];
    value = json["value"];
  }

  static int maxLength = 9999;
  setValue(String val) {
    if (!GetUtils.isNum(val)) {
      ToastKit.warning("请输入正确的离地距离哦");
      throw ArgumentError.value(val, "value", "请输入正确的离地距离哦");
    }
    double tmp = CommonKit.asDouble(val);
    if (tmp > maxLength) {
      tmp = maxLength.toDouble();
      ToastKit.warning("高度最多不能超过${maxLength}cm哦");
    }
    value = CommonKit.asDouble(val);
  }
}
