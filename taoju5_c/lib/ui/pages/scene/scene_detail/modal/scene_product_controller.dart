/*
 * @Description: 场景商品详情
 * @Author: iamsmiling
 * @Date: 2021-07-22 09:41:48
 * @LastEditTime: 2021-08-05 15:33:26
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_detail_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_product_entity.dart';
import 'dart:developer' as developer;

import 'package:taoju5_c/domain/repository/cart_repository.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/domain/repository/scene_repository.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/dialog/rolling_curtain_product_attribute/rolling_curtain_product_attribute_dialog.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/dialog/sectionalbar_product_attribute/sectionalbar_product_attribute_dialog.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/open_curtain_product_attribute_modal.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/open_finished_product_attribute_modal.dart'
    as modal;

class SceneProductController extends GetxController {
  CartRepository _repository = CartRepository();

  late SceneDetailEntity scene;

  void select(SceneProductEntity product, bool flag) {
    product.selected = flag;
    update();
  }

  void changeCount(SceneProductEntity product, int i) {
    product.count = i;
    update();
  }

  Future addToCart() {
    developer.log(scene.params.toString());
    return _repository.batchAddToCart(params: scene.params).then((value) {
      // Get.back();
    });
    // print(scene.params);
  }

  Future buy() async {
    await _saveMeasureId();
    return Get.toNamed(AppRoutes.commitOrder,
        arguments: scene.decoration.products
            .where((e) => e.selected)
            .map((e) => e.adapt())
            .toList(),
        preventDuplicates: false);
  }

  Future _saveMeasureId() {
    ProductRepository repository = ProductRepository();

    return Future.wait(
        scene.decoration.products.where((e) => e.selected).map((e) {
      if (e.productType is CustomProductType) {
        return repository.saveMeasureData(e.measureData.params).then((value) {
          e.measureId = value;
        });
      }
      return Future.value(-1).then((value) {
        e.measureId = value;
      });
    }));
  }

  Future modifyAttribute(SceneProductEntity product) {
    ProductDetailEntity p = ProductDetailEntity.fromSceneProduct(product);

    ///如果是卷帘
    if (product.productType is RollingCurtainProductType) {
      return openRollingCurtainProductAttributeDialog(Get.context!, product: p,
          footerBuilder: (BuildContext context) {
        return Container(
          width: R.dimen.width,
          alignment: Alignment.center,
          child: PrimaryButton(
            text: "确定",
            onPressed: () => _modifyRollingCurtainAttr(p, product),
            constraints: BoxConstraints(
                minHeight: R.dimen.dp45, minWidth: R.dimen.dp200),
          ),
        );
      });
    }

    ///如果是布艺帘
    return openCurtainProductAttributeModal(Get.context!,
        product: p,
        actionBar: PrimaryButton(
          text: "确定",
          onPressed: () => _modifyProductAttribute(p, product),
          constraints: BoxConstraints(
              minHeight: R.dimen.dp45,
              minWidth: R.dimen.dp200,
              maxHeight: R.dimen.dp45,
              maxWidth: R.dimen.dp200),
        ));
  }

  Future _modifyProductAttribute(
      ProductDetailEntity product, SceneProductEntity sceneProduct) {
    SceneRepository repository = SceneRepository();
    return repository
        .modifySceneProductAttribute(
            params: ({
      ...product.attribute.measureData.params,
      "sku_id": product.skuId,
      "length": product.length,
      "num": product.count,
      ...product.attribute.matchingSet.params
    }))
        .then((value) {
      value.measureData = product.attribute.measureData;
      sceneProduct.reAssign(value);
      Get.back();
      return value;
    }).whenComplete(update);
  }

  Future openFinishedProductAttributeModal(SceneProductEntity product) {
    if (product.productType is SectionbarProductType) {
      ProductDetailEntity p = ProductDetailEntity();
      p.length = product.length;
      p.count = product.count;
      p.price = product.price;

      return openSectionalbarProductAttributeDialog(Get.context!, product: p,
          footerBuilder: (BuildContext context) {
        return Container(
          alignment: Alignment.center,
          child: PrimaryButton(
            text: "确定",
            onPressed: () {
              _modifySectionalbarAttr(p, product);
            },
            size: PrimaryButtonSize.large,
          ),
        );
      });
    }
    ProductDetailEntity p = ProductDetailEntity.fromSceneProduct(product);

    /// [FinishedProductAttributeController]已经注册过的情况

    return modal.openFinishedProductAttributeModal(Get.context!, product: p,
        actionBuilder: (BuildContext context) {
      return PrimaryButton(
        text: "确定",
        onPressed: () => _modifySceneProductSku(p, product),
        constraints:
            BoxConstraints(minHeight: R.dimen.dp45, minWidth: R.dimen.dp200),
      );
    });
  }

  ///修改卷帘宽高 和空间
  _modifyRollingCurtainAttr(
      ProductDetailEntity product, SceneProductEntity sceneProduct) {
    sceneProduct.description =
        "宽:${product.attribute.measureData.size.widthM}米 高${product.attribute.measureData.size.heightM}米,${product.attribute.measureData.room.value}";
    sceneProduct.measureData = product.attribute.measureData;
    update();
    Get.back();
  }

  ///修改型材长度和数量
  _modifySectionalbarAttr(
      ProductDetailEntity product, SceneProductEntity sceneProduct) {
    sceneProduct.price = product.price;
    sceneProduct.count = product.count;
    sceneProduct.length = product.length ?? 100;
    double m = sceneProduct.length / 100;
    sceneProduct.description = "长度：$m米";
    update();
    Get.back();
  }

  ///修改成品sku
  _modifySceneProductSku(
      ProductDetailEntity product, SceneProductEntity sceneProduct) {
    sceneProduct.skuId = product.currentSku?.id ?? product.skuId;
    sceneProduct.description = product.currentSpecName;
    sceneProduct.price = product.price;
    sceneProduct.count = product.count;
    sceneProduct.subtotal = product.price;
    sceneProduct.image =
        product.currentSku?.picture.cover ?? sceneProduct.image;
    update();
    // sceneProduct.image = product
    return Get.back();
  }
}
