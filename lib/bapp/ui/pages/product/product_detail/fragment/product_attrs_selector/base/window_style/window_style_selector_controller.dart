/*
 * @Description: 打开方式安装昂视逻辑处理
 * @Author: iamsmiling
 * @Date: 2021-01-19 10:30:21
 * @LastEditTime: 2021-02-01 15:41:38
 */
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_mixin_model.dart';
import 'package:taoju5/bapp/domain/model/window/window_style_model.dart';
import 'package:taoju5/bapp/ui/pages/home/taojuwu_controller.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/measure_data/order_measure_data_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_pattern/window_pattern_selector_controller.dart';

class WindowStyleSelectorController extends GetxController {
  final String tag;

  WindowStyleSelectorController({@required this.tag});
  TaojuwuController get taojuwuController => Get.find<TaojuwuController>();

  WindowPatternSelectorController get windowPatternSelectorController =>
      Get.find<WindowPatternSelectorController>(tag: tag);
  WindowStyleOptionModel get style {
    List<WindowStyleOptionModel> list = taojuwuController.style.styleList;

    if (GetUtils.isNullOrBlank(list)) {
      return null;
    }
    if (Get.isRegistered<OrderMeasureDataController>()) {
      OrderMeasureDataController controller =
          Get.find<OrderMeasureDataController>();
      return list.firstWhere(
          (e) => RegExp(controller.measureData.windowPattern).hasMatch(e.name),
          orElse: () => list?.first);
    } else if (Get.arguments != null && Get.arguments is ProductMixinModel) {
      ProductMixinModel product = Get.arguments;

      if (product.style == null) {
        return list.firstWhere(
            (e) =>
                RegExp(windowPatternSelectorController.value).hasMatch(e.name),
            orElse: () => list?.first);
      }
      return product.style;
    } else {
      return list.firstWhere(
          (e) => RegExp(windowPatternSelectorController.value).hasMatch(e.name),
          orElse: () => list?.first);
    }
  }

  List<WindowInstallModeOptionModel> get installModeOptionList {
    if (style == null) return [];
    return style.installModeOptionList;
  }

  WindowInstallModeOptionModel get currentInstallModeOption {
    if (GetUtils.isNullOrBlank(installModeOptionList)) return null;
    return installModeOptionList?.firstWhere((e) => e.isChecked,
        orElse: () => null);
  }

  List<WindowOpenModeOptionModel> get openModeOptionList {
    if (style == null) return null;

    return style.openModeOptionList;
  }

  WindowOpenModeOptionModel get currentOpenModeOption =>
      openModeOptionList?.firstWhere((e) => e.isChecked, orElse: () => null);

  List<WindowSubopenModeModel> get subopenModeList {
    if (GetUtils.isNullOrBlank(openModeOptionList)) return [];
    return currentOpenModeOption?.suboptionList;
  }

  ///顶部主图
  String get mainImg {
    return currentInstallModeOption?.img ?? 'curtain/size_0100-1-1-SPW-H.png';
  }

  void selectInstallMode(
      {@required WindowInstallModeOptionModel option,
      bool canMultiple = false}) {
    if (canMultiple) {
      option.isChecked = !option.isChecked;
    } else {
      installModeOptionList?.forEach((e) {
        e.isChecked = e == option;
      });
    }
    update();
  }

  void selectOpenMode(
      {@required WindowOpenModeOptionModel option, bool canMultiple = false}) {
    if (canMultiple) {
      option.isChecked = !option.isChecked;
    } else {
      openModeOptionList?.forEach((e) {
        e.isChecked = e == option;
      });
    }
    update();
  }

  void selectSubopenMode(
      {@required WindowSubopenModeModel mode,
      @required WindowSubopenModeOptionModel option,
      bool canMultiple = false}) {
    if (canMultiple) {
      option.isChecked = !option.isChecked;
    } else {
      mode.optionList.forEach((e) {
        e.isChecked = e == option;
      });
    }
    update();
  }

  Map get data {
    String dataId = "${style?.id}";
    String windowPattern = style?.name;
    List<String> installMode = [currentInstallModeOption?.name];
    var openMode;
    String openModeName = currentOpenModeOption?.name;
    if (GetUtils.isNullOrBlank(currentOpenModeOption?.suboptionList)) {
      openMode = [openModeName];
    } else {
      Map map = {};
      for (WindowSubopenModeModel e in currentOpenModeOption?.suboptionList) {
        map[e?.title] = e?.optionList
            ?.firstWhere((element) => element.isChecked,
                orElse: () => e.optionList?.first)
            ?.name;
      }
      openMode = {openModeName: map};
    }
    return {
      "$dataId": jsonEncode({
        "name": windowPattern,
        "selected": {"安装选项": installMode, "打开方式": openMode}
      })
    };
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.isRegistered<OrderMeasureDataController>()) {
      _initWithOrderMeasureData();
      return;
    }
  }

  void _initWithOrderMeasureData() {
    OrderMeasureDataController controller =
        Get.find<OrderMeasureDataController>();
    OrderMeasureDataModel measureData = controller.measureData;
    List<WindowOpenModeOptionModel> list = style.openModeOptionList;

    list?.forEach((e) {
      e.isChecked = RegExp(measureData.openModeName)?.hasMatch(e.name);
      for (WindowSubopenModeModel o in e.suboptionList) {
        List<String> arr = measureData.openMode.split(";");
        for (String str in arr) {
          String key = str?.split(":")?.first?.trim();
          String val = str?.split(":")?.last?.trim();
          if (o.title.contains(key)) {
            o.optionList.forEach((p) {
              p.isChecked = p.name.contains(val);
            });
          }
        }
      }
    });
  }

  void _saveToOrderMeasureData() {
    OrderMeasureDataController controller =
        Get.find<OrderMeasureDataController>();
    controller.measureData.newOpenModeName = currentOpenModeOption.name;
    controller.update(["openMode"]);
  }

  void confirm() {
    currentInstallModeOption.isConfirmed = true;
    currentOpenModeOption.isConfirmed = true;
    subopenModeList?.forEach((e) {
      e.optionList?.forEach((element) {
        element.isConfirmed = element.isChecked;
      });
    });
    if (Get.isRegistered<OrderMeasureDataController>()) {
      _saveToOrderMeasureData();
    }

    if (Get.arguments != null && Get.arguments is ProductMixinModel) {
      ProductMixinModel product = Get.arguments;
      product.style = style.copy();
    }
  }
}
