/*
 * @Description: 选择器的父类
 * @Author: iamsmiling
 * @Date: 2021-01-18 10:54:20
 * @LastEditTime: 2021-02-01 17:12:40
 */

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/cart_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/ui/pages/home/taojuwu_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/cart_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/subpage/modify_curtain_product_attr/modify_curtain_product_attr_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/craft/craft_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/gauze/gauze_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/sectionalbar/sectionalbar_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_pattern/window_pattern_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/utils/common_kit.dart';

abstract class BaseAttrSelectorController extends GetxController {
  TaojuwuController taojuwuController = Get.find<TaojuwuController>();

  CurtainProductAttrModel attr;

  String get value => attr?.currentOptionName;

  String get typeName => attr?.typeName;

  String get description =>
      "${attr?.currentOptionName ?? ""} ${CommonKit.isNullOrZero(attr?.currentOptionPrice) ? "" : "¥" + attr?.currentOptionPrice?.toStringAsFixed(2)}";

  String get valueId => attr?.currentOptionId;

  double get price => attr?.currentOptionPrice;

  String get key => attr?.typeName;

  String get type => "${attr?.type}";

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  void _init() {
    _initFromCartPorductModel();
    _initFromMixinProductModel();
  }

  void initCheckState() {
    if (GetUtils.isNullOrBlank(attr?.optionList)) return;
    attr?.optionList?.first?.isChecked = true;
    attr?.optionList?.first?.hasConfirmed = true;
  }

  void assignToCartProduct() {
    if (Get.isRegistered<CartListParentController>()) {
      CartPorductModel e = Get.arguments;
      e?.attrsList?.forEach((element) {
        if (element.type == attr.type) {
          element.value = attr.currentOptionName;
        }
      });
    }
  }

  void _initFromCartPorductModel() {
    if (Get.isRegistered<CartListParentController>()) {
      if (Get.arguments != null &&
          Get.arguments is ModifyCurtainProductAttrEvent) {
        ModifyCurtainProductAttrEvent event = Get.arguments;
        CartPorductModel e = event.cart;
        e?.attrsList?.forEach((el) {
          if (el?.type == attr?.type) {
            attr?.optionList?.forEach((o) {
              o?.isChecked =
                  o.name.contains(el?.value) || el.value.contains(o.name);
              o?.hasConfirmed = o?.isChecked;
            });
          }
        });
      }

      update(["attribute"]);
    }
  }

  void _initFromMixinProductModel() {
    print(Get.arguments);
    if (Get.arguments != null &&
        Get.arguments is ModifyCurtainProductAttrEvent) {
      ModifyCurtainProductAttrEvent event = Get.arguments;
      if (GetUtils.isNullOrBlank(event.attrList)) return;
      event.attrList?.forEach((el) {
        if (el.type == "${attr?.type}") {
          attr?.optionList?.forEach((o) {
            o?.isChecked = el.id == "${o.id}";
            o?.hasConfirmed = o?.isChecked;
          });
        }
      });
    }
  }

  @mustCallSuper
  void select(
      CurtainProductAttrModel attr, CurtainProductAttrOptionModel option) {
    if (attr?.isMultiple ?? false) {
      option.isChecked = !option.isChecked;
    } else {
      for (CurtainProductAttrOptionModel o in attr.optionList) {
        o.isChecked = o.id == option.id;
      }
    }
    update(["attribute"]);
    if (Get.isRegistered<ProductDetailController>(tag: tag)) {
      Get.find<ProductDetailController>(tag: tag).updateTotalPrice();
    }
  }

  String get tag => Get.parameters["id"];
  CraftAttrSelectorController get craftController {
    if (Get.isRegistered<CraftAttrSelectorController>(tag: tag)) {
      return Get.find<CraftAttrSelectorController>(tag: tag);
    }
    return null;
  }

  SectionalbarAttrSelectorController get sectionalbarController {
    if (Get.isRegistered<SectionalbarAttrSelectorController>(tag: tag)) {
      return Get.find<SectionalbarAttrSelectorController>(tag: tag);
    }
    return null;
  }

  bool get hasGauze {
    if (Get.isRegistered<GauzeAttrSelectorController>(tag: tag)) {
      return Get.find<GauzeAttrSelectorController>(tag: tag).hasGauze;
    }
    return false;
  }

  bool get hasHole {
    return RegExp("打孔")
            .hasMatch(craftController?.attr?.currentOptionName ?? "") ??
        false;
  }

  bool get hasBox {
    if (Get.isRegistered<WindowPatternSelectorController>(tag: tag)) {
      WindowPatternSelectorController pattern =
          Get.find<WindowPatternSelectorController>(tag: tag);

      if (pattern.value.contains("有盒")) return true;
    }
    return false;
  }

  ///过滤逻辑
  void filter() {
    _filterCraft();
    filterSectionalbar();
  }

  ///筛选工艺
  void _filterCraft() {
    List<CurtainProductAttrOptionModel> list =
        taojuwuController?.craft?.optionList;

    ///作为容器存储
    List<CurtainProductAttrOptionModel> options = [];

    ///如果有盒
    if (hasBox) {
      for (CurtainProductAttrOptionModel option in list) {
        if (option.hasTrack) {
          options.add(option);
        }
      }
    } else {
      options = list;
    }

    // ///如果不要需要窗纱
    // if (!hasGauze) {
    //   ///不需要窗纱 过滤出单龙马杆
    //   options = options.where((e) => e.isSinglePole).toList();
    // } else {
    //   ///需要窗纱过滤 双龙马杆
    //   options = options.where((e) => !e.isSinglePole).toList();
    // }

    ///默认选中第一个
    for (int i = 0; i < options?.length; i++) {
      options[i].isChecked = i == 0;
      options[i].hasConfirmed = options[i].isChecked;
    }

    ///更新型材选项
    craftController?.attr?.optionList = options;
    craftController?.update();
  }

  void filterSectionalbar() {
    List<CurtainProductAttrOptionModel> list =
        taojuwuController?.sectionalbar?.optionList;

    ///作为容器存储
    List<CurtainProductAttrOptionModel> options = list;

    ///如果有盒
    // if (hasBox) {
    //   for (CurtainProductAttrOptionModel option in list) {
    //     if (option.hasTrack) {
    //       options.add(option);
    //     }
    //   }
    // } else {
    //   options = list;
    // }

    //如果需要打孔
    if (craftController.value.contains("罗马杆")) {
      ///过滤出龙马杆
      options = options.where((e) => e.isDragonHorsePole).toList();
    } else {
      options = options.where((e) => !e.isDragonHorsePole).toList();
    }

    ///默认选中第一个
    for (int i = 0; i < options?.length; i++) {
      options[i].isChecked = i == 0;
      options[i].hasConfirmed = options[i].isChecked;
    }

    sectionalbarController?.attr?.optionList = options;
    sectionalbarController?.update();
  }

  Future<bool> reset() {
    List<CurtainProductAttrOptionModel> optionList = attr?.optionList;
    optionList?.forEach((e) {
      e.isChecked = e.hasConfirmed;
    });
    update(["options"]);
    Get.back();
    return Future.value(true);
  }

  void confirm() {
    attr?.optionList?.forEach((e) {
      e.hasConfirmed = e.isChecked;
      update(["value"]);
    });

    // if (Get.isRegistered<ProductDetailController>()) {
    //   Get.find<ProductDetailController>(tag: tag).updateTotalPrice();
    // }

    Get.back();
  }

  CurtainProductAttrAdapterModel adapt() {
    return CurtainProductAttrAdapterModel(
      id: attr?.currentOptionId,
      value: attr?.currentOptionName,
      key: attr?.typeName,
      price: attr?.currentOptionPrice,
      type: "${attr?.type}",
      typeName: attr?.typeName,
    );
  }
}
