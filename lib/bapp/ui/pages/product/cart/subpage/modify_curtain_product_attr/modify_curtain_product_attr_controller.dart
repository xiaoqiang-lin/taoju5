import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/cart_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/cart_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/accessory/accessory_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/base_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/craft/craft_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/gauze/gauze_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/riboux/riboux_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/sectionalbar/sectionalbar_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/valance/valance_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/xdio/x_dio.dart';

class ModifyCurtainProductAttributeResult {
  List<CurtainProductAttrAdapterModel> attrList;
  Map attribute;
  Map measureData;
  double width;
  double height;

  ModifyCurtainProductAttributeResult(
      {this.attrList,
      this.attribute,
      this.measureData,
      this.width,
      this.height});
}

class ModifyCurtainProductAttrEvent {
  CartPorductModel cart;
  String tag;
  List<CurtainProductAttrAdapterModel> attrList;
  bool isFromCart;
  int productTagId;
  String category;

  ModifyCurtainProductAttrEvent(
      {this.attrList,
      @required this.tag,
      this.isFromCart = true,
      this.category,
      this.cart,
      this.productTagId});
}

class ModifyCurtainProductAttrController<T extends BaseAttrSelectorController>
    extends GetxController {
  ModifyCurtainProductAttrEvent event;

  String tag;

  String category;

  bool isFromCart;

  int tagId;

  Future confirm() {
    if (event.isFromCart) {
      return _modifyCurtainProductAttrInCart();
    }
    ModifyCurtainProductAttributeResult result =
        ModifyCurtainProductAttributeResult(
            attrList: adapt(),
            attribute: CurtainProductAtrrParamsModel(tag: tag).params);
    Get.back(result: result);
    return Future.value(true);
  }

  Future _modifyCurtainProductAttrInCart() {
    ProductRepository repository = ProductRepository();
    CurtainProductAtrrParamsModel args =
        CurtainProductAtrrParamsModel(tag: tag);

    return repository.modifyProductAttr(params: {
      "cart_id": tag,
      "wc_attr": jsonEncode(args.params)
    }).then((BaseResponse response) {
      if (Get.isRegistered<CartListController>(tag: category)) {
        CartListController listController =
            Get.find<CartListController>(tag: category);
        listController.loadData().then((value) {
          CartListParentController parentController = Get.find();
          parentController.isCheckedAll = false;
        });
      }
      Get.back();
    }).catchError((err) {});
  }

  BaseAttrSelectorController _find<T extends BaseAttrSelectorController>(
      String tag) {
    if (Get.isRegistered<T>(tag: tag)) {
      return Get.find<T>(tag: tag);
    }
    return null;
  }

  List<CurtainProductAttrAdapterModel> adapt() {
    return [
      _find<GauzeAttrSelectorController>(tag),
      _find<SectionalbarAttrSelectorController>(tag),
      _find<ValanceAttrSelectorController>(tag),
      _find<RibouxAttrSelectorController>(tag),
      _find<AccessoryAttrSelectorController>(tag),
      _find<CraftAttrSelectorController>(tag)
    ]
        .map((e) => e?.adapt())
        ?.where((e) => !GetUtils.isNullOrBlank(e?.id))
        ?.toList();
  }

  @override
  void onInit() {
    if (Get.arguments != null &&
        Get.arguments is ModifyCurtainProductAttrEvent) {
      event = Get.arguments;
      tag = event?.tag;
      tagId = event?.productTagId;
    }

    category = Get.parameters["category"];
    super.onInit();
  }
}
