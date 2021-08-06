/*
 * @Description: 窗帘商品属性选择
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:57:25
 * @LastEditTime: 2021-08-06 10:58:05
 */
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/params/order/matching_set_params.dart';
import 'package:taoju5_c/domain/entity/params/order/measure_data_params.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_facade_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_install_mode_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_open_mode_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_room_entity.dart';
import 'package:taoju5_c/domain/repository/cart_repository.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/price_delegator/price_delegator.dart';

class CurtainProductAttributeController
    extends BaseFutureLoadStateController<CurtainAttributeEntity> {
  ProductDetailEntity product;
  late FabricCurtainProductPriceDelegator priceDelegator;
  late MeasureDataParamsEntity measureDataArg;
  late MatchingSetParamsEntity matchingSetArg;
  late CurtainMeasureDataAttributeEntity? measureData;
  late CurtainMatchingSetAttributeEntity? matchingSet;
  late Function(
          CurtainMeasureDataAttributeEntity, CurtainMatchingSetAttributeEntity)
      initAttribute;
  CurtainProductAttributeController(
      {required this.product, this.measureData, this.matchingSet}) {
    priceDelegator = FabricCurtainProductPriceDelegator(product);
  }

  Future<CurtainAttributeEntity> loadData({Map? params}) {
    ProductRepository repository = ProductRepository();

    return repository.productAttribute(
        {"goods_id": product.id, ...(params ?? {})}).then((value) async {
      product.attribute = value;

      if (product.measureId != -1) {
        await repository.measureData(
            params: {"measure_id": product.measureId}).then((value) {
          product.attribute.measureData.initFromJson(value);
          measureDataArg = MeasureDataParamsEntity(
              measureData: product.attribute.measureData,
              finished: product.attribute.finished);
          matchingSetArg = MatchingSetParamsEntity(
              attribute: product.attribute.matchingSet,
              finished: product.attribute.finished);
        });
      }
      return value;
    }).whenComplete(update);
  }

  ///当前编辑的属性下标
  int currentIndex = 0;

  void next() {
    try {
      measureDataArg.validate();
      measureDataArg.finished = true;
      switchIndex(1);
    } catch (err) {
      measureDataArg.finished = false;
    } finally {
      update();
    }
  }

  void nextWithoutValidate() {
    measureDataArg.finished = true;
    switchIndex(1);
    update();
  }

  switchIndex(int index) {
    if (currentIndex == index) return;
    currentIndex = index;
    FocusManager.instance.primaryFocus?.unfocus();
    update();
  }

  ///选择窗型
  selectWindow(WindowFacadeEntity facade, WindowFacadeOptionEntity option) {
    for (WindowFacadeOptionEntity o in facade.options) {
      o.selected = o == option;
    }
    _filterCraft();
    update();
  }

  selectRoom(WindowRoomOptionEntity option) {
    for (WindowRoomOptionEntity o
        in product.attribute.measureData.room.options) {
      o.selected = o == option;
    }
    update();
  }

  selectInstallMode(WindowInstalllModeEntity installMode,
      WindowInstallModeOptionEntity option) {
    for (WindowInstallModeOptionEntity o in installMode.options) {
      o.selected = o == option;
    }
    update();
  }

  ///选择打开方式
  selectOpenMode(WindowOpenModeOptionEntity option) {
    product.attribute.measureData.openOptions.forEach((e) {
      e.selected = e == option;
    });

    update();
  }

  ///选择子打开方式
  selectChildOpenMode(
      WindowOpenModeEntity openMode, WindowOpenModeOptionEntity option) {
    openMode.options.forEach((e) {
      e.selected = e == option;
    });
    update();
  }

  ///选择窗帘附属商品
  selectAdditonalProduct(CurtainAddtionalProductEntity item,
      CurtainAddtionalProductOptionEntity option) {
    for (CurtainAddtionalProductOptionEntity o in item.options) {
      o.selected = o == option;
    }

    ///如果当前操作的是型材
    if (item == product.attribute.matchingSet.craft) {
      _filterSectionalbar();
    }

    ///取出当前的工艺
    update();
  }

  ///在关闭弹窗时会调用
  hasFinished() {
    bool flag = true;
    for (CurtainAddtionalProductEntity item
        in product.attribute.matchingSet.attributes) {
      flag = !item.isRequired ? true : item.selectedOption == null;
    }
    matchingSetArg.finished = flag;
    product.attribute.finished =
        matchingSetArg.finished && measureDataArg.finished;

    ///数据修改成功后 改变商品规格提示信息
    if (product.attribute.finished) {
      product.specTip = product.attribute.brief;
    }
  }

  ///筛选 工艺
  void _filterCraft() {
    ///有盒只能选择轨道
    for (CurtainAddtionalProductOptionEntity o
        in product.attribute.matchingSet.craft.initialOptions) {
      o.visibile =
          !product.attribute.measureData.hasBox ? true : o.name.contains("轨道");
      o.selected = false;
    }
    _filterSectionalbar();
  }

  ///筛选 型材
  void _filterSectionalbar() {
    ///工艺
    CurtainAddtionalProductEntity craft = product.attribute.matchingSet.craft;
    if (craft.selectedOption == null) return;
    for (CurtainAddtionalProductOptionEntity o
        in product.attribute.matchingSet.sectionalbar.initialOptions) {
      o.visibile = craft.selectedOption!.value.contains(o.value);
      o.selected = false;
    }
  }

  saveMeasureData() {
    ProductRepository repository = ProductRepository();
    return repository.saveMeasureData(measureDataArg.params).then((value) {
      product.measureId = value;
      product.craftId =
          product.attribute.matchingSet.craft.selectedOption?.id ?? -1;
      product.args = {
        "wc_attr": jsonEncode({
          "craft_id": [
            product.attribute.matchingSet.craft.selectedOption?.id ?? 0
          ],
          "gauze_id": [
            product.attribute.matchingSet.gauze.selectedOption?.id ?? 0
          ],
          "parts_id": [
            product.attribute.matchingSet.sectionalbar.selectedOption?.id ?? 0
          ],
          "curtain_id": [
            product.attribute.matchingSet.valance.selectedOption?.id ?? 0
          ],
          "lining_id": [
            product.attribute.matchingSet.riboux.selectedOption?.id ?? 0
          ],
        })
      };
      product.specTip =
          "【${product.attribute.measureData.room.selectedOption?.name}】【${product.attribute.measureData.facade.value}】【${product.attribute.measureData.installMode.selectedOption?.name ?? ''}】【${product.attribute.measureData.openModeDescription}】【\n 宽:${product.attribute.measureData.size.widthM}m/高${product.attribute.measureData.size.heightM}m/离地距离:${product.attribute.measureData.groundClearance.value}cm";
      return value;
    });
  }

  Future addToCart() async {
    CartRepository repository = CartRepository();
    try {
      matchingSetArg.validate();
      product.attribute.finished = true;
      // ToastKit.loading();
      int measureId = await saveMeasureData();

      ///此时还没有获取到测量id ，初始化为-1
      // AddToCartParamsEntity arg =
      //     AddToCartParamsEntity(measureId: measureId, product: product);
      // await repository.addToCart(params: arg.params);
    } catch (err) {
      print(err);
      // product.attribute!.finished = false;
      return Future.error(err);
    } finally {
      // ToastKit.dismiss();
    }
  }
}

class CartCurtainProductAttributeController
    extends CurtainProductAttributeController {
  CartCurtainProductAttributeController({
    required ProductDetailEntity product,
  }) : super(product: product);

  @override
  Future<CurtainAttributeEntity> loadData({Map? params}) {
    return Future.value();
  }
}
