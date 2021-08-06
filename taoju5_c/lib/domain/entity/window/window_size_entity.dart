/*
 * @Description:  窗户大小
 * @Author: iamsmiling
 * @Date: 2021-05-10 17:58:48
 * @LastEditTime: 2021-07-22 11:21:16
 */
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_c/utils/toast.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';

class WindowSizeEntity {
  late String label;
  double? width;
  double? height;
  ShakeAnimationController widthShakeController = ShakeAnimationController();
  ShakeAnimationController heightShakeController = ShakeAnimationController();
  bool widthError = false;
  bool heightError = false;

  WindowSizeEntity();
  WindowSizeEntity.fromJson(Map? json) {
    if (json == null) return;
    label = json["label"];
    width = json["width"];
    height = json["height"];
  }

  static int maxLength = 9999;

  Map get params => {"width": width, "height": height};

  double get widthM => (width ?? 0) / 100;
  double get heightM => (height ?? 0) / 100;

  setWidth(String val) {
    if (!GetUtils.isNum(val)) {
      ToastKit.warning("请输入正确的宽度哦");
      throw ArgumentError.value(val, "width", "请输入正确的宽度哦");
    }
    double tmp = CommonKit.asDouble(val);
    if (tmp > maxLength) {
      tmp = maxLength.toDouble();
      ToastKit.warning("宽度最多不能超过${maxLength}cm哦");
    }
    width = tmp;
  }

  setHeight(String val) {
    if (!GetUtils.isNum(val)) {
      ToastKit.warning("请输入正确的高度哦");
      throw ArgumentError.value(val, "height", "请输入正确的高度哦");
    }
    double tmp = CommonKit.asDouble(val);
    if (tmp > maxLength) {
      tmp = maxLength.toDouble();
      ToastKit.warning("高度最多不能超过${maxLength}cm哦");
    }
    height = tmp;
  }

  onWidthError() {
    widthError = true;
    widthShakeController.start(shakeCount: 1);
  }

  onHeightError() {
    heightError = true;
    heightShakeController.start(shakeCount: 1);
  }
}
