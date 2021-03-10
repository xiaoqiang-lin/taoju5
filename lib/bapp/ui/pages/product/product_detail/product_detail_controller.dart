/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2020-12-21 14:43:22
 * @LastEditTime: 2021-02-02 10:32:12
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_adapter_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/gauze/gauze_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/riboux/riboux_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/room/room_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/sectionalbar/sectionalbar_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base_curtain_product_attrs_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_pridce_delegator.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';

import 'fragment/product_attrs_selector/base/accessory/accessory_attr_selector_controller.dart';
import 'fragment/product_attrs_selector/base/base_attr_selector_controller.dart';
import 'fragment/product_attrs_selector/base/craft/craft_attr_selector_controller.dart';
import 'fragment/product_attrs_selector/base/valance/valance_attr_selector_controller.dart';
import 'fragment/product_attrs_selector/base/window_pattern/window_pattern_selector_controller.dart';
import 'fragment/product_attrs_selector/base/window_style/window_style_selector_controller.dart';

class MeasureDataParamsModel {
  String width;
  String height;
}

class CurtainProductAtrrParamsModel<T> {
  String tag;

  CurtainProductAtrrParamsModel({@required this.tag});

  List get _controllers => [
        _find<RoomAttrSelectorController>(tag: tag),
        _find<GauzeAttrSelectorController>(tag: tag),
        _find<CraftAttrSelectorController>(tag: tag),
        _find<SectionalbarAttrSelectorController>(tag: tag),
        _find<RibouxAttrSelectorController>(tag: tag),
        _find<ValanceAttrSelectorController>(tag: tag),
        _find<AccessoryAttrSelectorController>(tag: tag),
        _find<SizeSelectorController>(tag: tag)
      ];

  T _find<T>({@required String tag}) {
    if (Get.isRegistered<T>(tag: tag)) {
      return Get.find<T>(tag: tag);
    }
    return null;
  }

  Map get params {
    Map map = {};
    _controllers.forEach((e) {
      if (e == null) {
        return;
      }
      if (e is BaseAttrSelectorController) {
        map.addAll(e?.attr?.params ?? {});
      }
      if (e is SizeSelectorController) {
        map.addAll(e?.params ?? {});
      }
    });
    return map;
  }
}

class ProductDetailController extends GetxController {
  ProductRepository _repository = ProductRepository();

  ProductDetailModelWrapper wrapper;

  ProductDetailModel product;

  XLoadState loadState = XLoadState.idle;

  BaseCurtainProductAttrsSelectorController selectorController;

  BasePoductPriceDelegator get priceDelegator {
    if (product.productType is FabricCurtainProductType) {
      return FabricCurtainProductPriceDelegator();
    }
    if (product.productType is RollingCurtainProductType) {
      return RollingCurtainProductPriceDelegator();
    }
    if (product.productType is GauzeCurtainProductType) {
      return GauzeCurtainProductPriceDelegator();
    }
    return null;
  }

  ScrollController scrollController;

  ///搭配精选
  List<ProductModel> mixedProductList;

  ///为你推荐
  List<ProductModel> recomendProductList;

  ///场景推荐
  List<DesignProductModel> sceneDesignProductList;

  ///软装方案
  List<DesignProductModel> softDesignProductList;

  Future _loadData() {
    loadState = XLoadState.busy;

    return _repository.productDetail(params: {"goods_id": id}).then(
        (ProductDetailModelWrapper wrapper) {
      loadState = XLoadState.idle;
      this.wrapper = wrapper;
      product = wrapper.product;
      mixedProductList = wrapper.mixedProductList;
      sceneDesignProductList = wrapper.sceneDesignProductList;
      softDesignProductList = wrapper.softDesignProductList;
      recomendProductList = wrapper.recommendedProductList;
      scrollController = ScrollController();
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  Future buy() {}

  Future addToCart() {}

  @override
  void onInit() {
    _loadData();

    super.onInit();
  }

  @override
  void onClose() {
    print("++++____");
    scrollController?.dispose();
    _onClose();
    super.onClose();
  }

  String get id => Get.parameters["id"];
  String get tag => "$id";
  List<GetxController> get _attrControllerList => [
        Get.find<RoomAttrSelectorController>(tag: tag),
        Get.find<GauzeAttrSelectorController>(tag: tag),
        Get.find<CraftAttrSelectorController>(tag: tag),
        Get.find<CraftAttrSelectorController>(tag: tag),
        Get.find<SectionalbarAttrSelectorController>(tag: tag),
        Get.find<RibouxAttrSelectorController>(tag: tag),
        Get.find<SizeSelectorController>(tag: tag),
        Get.find<ValanceAttrSelectorController>(tag: tag),
        Get.find<RibouxAttrSelectorController>(tag: tag),
        Get.find<WindowStyleSelectorController>(tag: tag)
      ];

  void _onClose() {
    _attrControllerList?.forEach((e) {
      e?.onClose();
      e?.onDelete();
    });

    _onDelete();
  }

  void _onDelete({bool force = true}) {
    print("++++___");
    Get.delete<RoomAttrSelectorController>(tag: tag, force: force);
    Get.delete<AccessoryAttrSelectorController>(tag: tag, force: force);
    Get.delete<GauzeAttrSelectorController>(tag: tag, force: force);
    Get.delete<CraftAttrSelectorController>(tag: tag, force: force);
    Get.delete<SectionalbarAttrSelectorController>(tag: tag, force: force);
    Get.delete<RibouxAttrSelectorController>(tag: tag, force: force);
    Get.delete<ValanceAttrSelectorController>(tag: tag, force: force);
    Get.delete<WindowPatternSelectorController>(tag: tag, force: force);

    Get.delete<SizeSelectorController>(tag: tag, force: force);
    Get.delete<WindowStyleSelectorController>(tag: tag, force: force);
  }

  void updateTotalPrice() {
    update(["totalPrice"]);
  }

  ///模型适配转换
  List<ProductAdapterModel> adapt() {
    Map json = {
      "id": product.id,
      "name": product.name,
      "room": selectorController.room.currentOptionName,
      "price": product.price,
      // "attrList": selectorController.attrList,
      "description": "",
      "totalPrice": priceDelegator.totalPrice
    };
    return [ProductAdapterModel.fromJson(json)];
  }
}
