/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:05:21
 * @LastEditTime: 2021-06-04 07:30:37
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/params/cart/add_to_cart_params.dart';
import 'package:taoju5_c/domain/entity/params/order/matching_set_params.dart';
import 'package:taoju5_c/domain/entity/params/order/measure_data_params.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/repository/cart_repository.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/product/component/product_action_bar.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/dialog/sectionalbar_product_attribute/sectionalbar_product_attribute_dialog.dart'
    as sectionalbarProductDialog;
import 'package:taoju5_c/ui/pages/product/product_detail/modal/open_finished_product_attribute_modal.dart'
    as finishedProductModal;
import 'package:taoju5_c/ui/pages/product/product_detail/modal/open_curtain_product_attribute_modal.dart'
    as curtainProductModal;

import 'dialog/rolling_curtain_product_attribute/rolling_curtain_product_attribute_dialog.dart'
    as rollingCurtainProductDialog;

class ProductDetailController
    extends BaseFutureLoadStateController<ProductDetailEntity> {
  ProductRepository _repository = ProductRepository();

  String? id = Get.parameters["id"];

  late ProductDetailEntity product;

  ProductAttributeEntity attribute = ProductAttributeEntity();

  @override
  Future<ProductDetailEntity> loadData({Map? params}) {
    return _repository.productDetail({"goods_id": id}).then((value) {
      product = value;

      return value;
    });
  }

  ///选择属性
  openFinishedProductAttributeModal() {
    if (Get.isBottomSheetOpen == true) return;
    finishedProductModal.openFinishedProductAttributeModal(Get.context!,
        product: product, footerBuilder: (BuildContext context) {
      return Container(
        height: kBottomNavigationBarHeight,
        padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
        margin: EdgeInsets.only(bottom: Get.mediaQuery.padding.bottom),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "小计",
                  style: TextStyle(fontSize: R.dimen.sp12),
                ),
                Text(
                  "¥${product.currentSku?.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: R.color.ffff5005, fontSize: R.dimen.sp14),
                )
              ],
            ),
            ProductActionBar(
              onAddToCart: () {
                attribute.finished = true;
                addToCart();
              },
              onPurchase: () {
                attribute.finished = true;
                buy();
              },
            )
          ],
        ),
      );
    }).whenComplete(() {
      attribute.finished = true;
    });
  }

  openCurtainProductAttributeModal() {
    if (Get.isBottomSheetOpen == true) return;
    return _repository
        .productAttribute({"goods_id": id})
        .then((value) {
          attribute = value;
        })
        .catchError((err) {})
        .then((value) {
          curtainProductModal.openCurtainProductAttributeModal(Get.context!,
              product: product, attribute: attribute as CurtainAttributeEntity);
        });
  }

  openRollingCurtainProductAttributeDialog() {
    return _repository.productAttribute({"goods_id": id}).then((value) {
      attribute = value;
    }).catchError((err) {
      print(err);
    }).then((value) {
      rollingCurtainProductDialog.openRollingCurtainProductAttributeDialog(
          Get.context!,
          product: product,
          attribute: attribute as CurtainAttributeEntity);
    });

    // if (Get.isBottomSheetOpen == true) return;
    // return _repository
    //     .productAttribute({"goods_id": id})
    //     .then((value) {
    //       attribute = value;
    //     })
    //     .catchError((err) {})
    //     .then((value) {
    //       curtainProductModal.openCurtainProductAttributeModal(Get.context!,
    //           product: product, attribute: attribute);
    //     });
  }

  openSectionalbarProductAttributeDialog() {
    return sectionalbarProductDialog.openSectionalbarProductAttributeDialog(
        Get.context!,
        product: product,
        attribute: attribute);
  }

  Future addToCart() {
    CartRepository cartRepository = CartRepository();
    MatchingSetParamsEntity? matchingSet =
        product.productType is! FabricCurtainProductType
            ? null
            : MatchingSetParamsEntity(
                attribute: (attribute as CurtainAttributeEntity).matchingSet);
    AddToCartParamsEntity arg = AddToCartParamsEntity(
        product: product,
        finished: attribute.finished,
        matchingSet: matchingSet);

    if (arg.finished) {
      if (product.productType is! FinishedProductType) {
        saveMeasureData().then((value) {
          product.measureId = value;
          return cartRepository.addToCart(params: arg.params);
        });
      }
      product.specTip = "${product.currentSpecName} x${product.count}";
      return cartRepository.addToCart(params: arg.params);
    }
    return showAttributePicker();
  }

  Future showAttributePicker() {
    if (product.productType is FabricCurtainProductType) {
      return openCurtainProductAttributeModal();
    } else if (product.productType is RollingCurtainProductType) {
      return openRollingCurtainProductAttributeDialog();
    } else if (product.productType is SectionbarProductType) {
      return openSectionalbarProductAttributeDialog();
    }
    return openFinishedProductAttributeModal();
  }

  Future saveMeasureData() {
    ProductRepository repository = ProductRepository();

    MeasureDataParamsEntity arg = MeasureDataParamsEntity(
        measureData: (attribute as CurtainAttributeEntity).measureData);
    return repository.saveMeasureData(arg.params);
  }

  Future? buy() {
    ///measureId为1 说明没有
    try {
      print(attribute.finished);
      print("+++++++++++++++_____________");
      if (attribute.finished) {
        ///这里用try catch 是因为 attribute没有初始化可能会报错
        if (product.productType is! FinishedProductType) {
          return saveMeasureData().then((value) {
            product.measureId = value;
            Get.toNamed(AppRoutes.commitOrder, arguments: [
              product.adapt((attribute as CurtainAttributeEntity)
                  .matchingSet
                  .attributes
                  .map((e) => e.adapt())
                  .toList())
            ]);
          });
        }
        product.attributeDesc = "${product.currentSpecName} x${product.count}";
        product.specTip = "${product.currentSpecName} x${product.count}";
        return Get.toNamed(AppRoutes.commitOrder,
            arguments: [product.adapt([])]);
      }
      return showAttributePicker();
    } catch (err, s) {
      print(err);
      print(s);
      return showAttributePicker();
    }

    // CartRepository cartRepository = CartRepository();
    // AddToCartParamsEntity arg = AddToCartParamsEntity(product: product);
    // return cartRepository.addToCart(params: arg.params);
  }
}
