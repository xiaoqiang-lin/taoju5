/*
 * @Description: 窗帘商品属性选择
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:57:25
 * @LastEditTime: 2021-06-03 17:26:55
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/params/cart/add_to_cart_params.dart';
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
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/price_delegator/price_delegator.dart';

class CurtainProductAttributeController extends GetxController {
  ProductDetailEntity product;
  CurtainAttributeEntity atrribute;
  late FabricCurtainProductPriceDelegator priceDelegator;
  late MeasureDataParamsEntity measureDataArg;
  late MatchingSetParamsEntity matchingSetArg;
  CurtainProductAttributeController(
      {required this.product, required this.atrribute}) {
    priceDelegator = FabricCurtainProductPriceDelegator(product, atrribute);
    measureDataArg = MeasureDataParamsEntity(
        measureData: atrribute.measureData, finished: atrribute.finished);
    matchingSetArg = MatchingSetParamsEntity(
        attribute: atrribute.matchingSet, finished: atrribute.finished);
  }

  ///当前编辑的属性下标
  int currentIndex = 0;

  void next() {
    try {
      measureDataArg.validate();
      measureDataArg.finished = true;
      switchIndex(1);
    } catch (err) {
      print(err);
      measureDataArg.finished = false;
    } finally {
      update();
    }
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
    for (WindowRoomOptionEntity o in atrribute.measureData.room.options) {
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
    atrribute.measureData.openOptions.forEach((e) {
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
    if (item == atrribute.matchingSet.craft) {
      _filterSectionalbar();
    }

    ///取出当前的工艺
    update();
  }

  ///在关闭弹窗时会调用
  hasFinished() {
    bool flag = true;
    for (CurtainAddtionalProductEntity item
        in atrribute.matchingSet.attributes) {
      flag = !item.isRequired ? true : item.selectedOption == null;
    }
    matchingSetArg.finished = flag;
    atrribute.finished = matchingSetArg.finished && measureDataArg.finished;

    ///数据修改成功后 改变商品规格提示信息
    if (atrribute.finished) {
      product.specTip = atrribute.brief;
    }
  }

  ///筛选 工艺
  void _filterCraft() {
    ///有盒只能选择轨道
    for (CurtainAddtionalProductOptionEntity o
        in atrribute.matchingSet.craft.initialOptions) {
      o.visibile = !atrribute.measureData.hasBox ? true : o.name.contains("轨道");
      o.selected = false;
    }
    _filterSectionalbar();
  }

  ///筛选 型材
  void _filterSectionalbar() {
    ///工艺
    CurtainAddtionalProductEntity craft = atrribute.matchingSet.craft;
    if (craft.selectedOption == null) return;
    for (CurtainAddtionalProductOptionEntity o
        in atrribute.matchingSet.sectionalbar.initialOptions) {
      o.visibile = craft.selectedOption!.value.contains(o.value);
      o.selected = false;
    }
  }

  saveMeasureData() {
    ProductRepository repository = ProductRepository();
    return repository.saveMeasureData(measureDataArg.params).then((value) {
      product.measureId = value;
      product.craftId = atrribute.matchingSet.craft.selectedOption?.id ?? -1;
      product.args = {
        "wc_attr": jsonEncode({
          "craft_id": [atrribute.matchingSet.craft.selectedOption?.id ?? 0],
          "gauze_id": [atrribute.matchingSet.gauze.selectedOption?.id ?? 0],
          "parts_id": [
            atrribute.matchingSet.sectionalbar.selectedOption?.id ?? 0
          ],
          "curtain_id": [atrribute.matchingSet.valance.selectedOption?.id ?? 0],
          "lining_id": [atrribute.matchingSet.riboux.selectedOption?.id ?? 0],
        })
      };
      product.attributeDesc =
          "【${atrribute.measureData.room.selectedOption?.name}】【${atrribute.measureData.facade.value}】【${atrribute.measureData.installMode.selectedOption?.name ?? ''}】【${atrribute.measureData.openModeDescription}】【\n 宽:${atrribute.measureData.size.widthM}m/高${atrribute.measureData.size.heightM}m/离地距离:${atrribute.measureData.groundClearance.value}cm";
      return value;
    });
  }

  Future addToCart() async {
    CartRepository repository = CartRepository();
    try {
      matchingSetArg.validate();
      atrribute.finished = true;
      // ToastKit.loading();
      int measureId = await saveMeasureData();

      ///此时还没有获取到测量id ，初始化为-1
      AddToCartParamsEntity arg = AddToCartParamsEntity(
          measureId: measureId, product: product, matchingSet: matchingSetArg);
      await repository.addToCart(params: arg.params);
    } catch (err) {
      print(err);
      atrribute.finished = false;
      return Future.error(err);
    } finally {
      // ToastKit.dismiss();
    }
  }

  Future buy() async {
    try {
      matchingSetArg.validate();
      atrribute.finished = true;
      // ToastKit.loading();
      await saveMeasureData();

      return Get.toNamed(AppRoutes.commitOrder,
          arguments: [product.adapt(atrribute.list)]);
    } catch (err, s) {
      print(err);
      print(s);
    }
  }
}
