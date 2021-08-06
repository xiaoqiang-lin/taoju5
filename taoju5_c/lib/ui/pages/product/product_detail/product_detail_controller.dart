/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:05:21
 * @LastEditTime: 2021-08-05 15:54:38
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/chimera_refresh_builder.dart';
import 'package:taoju5_c/domain/entity/params/cart/add_to_cart_params.dart';
import 'package:taoju5_c/domain/entity/params/order/matching_set_params.dart';
import 'package:taoju5_c/domain/entity/params/order/measure_data_params.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/repository/cart_repository.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';
import 'package:taoju5_c/ui/pages/product/component/product_action_bar.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/dialog/sectionalbar_product_attribute/sectionalbar_product_attribute_dialog.dart'
    as sectionalbarProductDialog;
import 'package:taoju5_c/ui/pages/product/product_detail/modal/finished_product_attribute_modal/finished_product_attribute_modal_controller.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/open_finished_product_attribute_modal.dart'
    as finishedProductModal;
import 'package:taoju5_c/ui/pages/product/product_detail/modal/open_curtain_product_attribute_modal.dart'
    as curtainProductModal;
import 'package:taoju5_c/ui/pages/product/product_detail/modal/select_product_modal/select_product_modal.dart';

import 'dialog/rolling_curtain_product_attribute/rolling_curtain_product_attribute_dialog.dart'
    as rollingCurtainProductDialog;
import 'dialog/rolling_curtain_product_attribute/rolling_curtain_product_controller.dart';
import 'dialog/sectionalbar_product_attribute/sectionalbar_product_attribute_dialog.dart';
import 'modal/curtain_product_attribute_modal/curtain_product_attribute_controller.dart';

class ProductDetailController
    extends ChimeraRefreshController<ProductDetailEntity> {
  ProductRepository _repository = ProductRepository();

  String? id = Get.parameters["id"];

  late ProductDetailEntity product;

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => CommendationController(controller: refreshController),
        tag: "product-$id");
    Get.lazyPut(() => CurtainProductAttributeController(product: product),
        tag: "$id");
    print(Get.parameters);
  }

  @override
  Future<ProductDetailEntity> loadData({Map? params}) {
    return _repository.productDetail({"goods_id": id}).then((value) {
      product = value;

      Get.lazyPut(() => FinishedProductAttributeController(product: product),
          tag: "${product.id}");
      return value;
    });
  }

  ///选择属性
  openFinishedProductAttributeModal() {
    if (Get.isBottomSheetOpen == true) return;
    finishedProductModal.openFinishedProductAttributeModal(Get.context!,
        product: product, actionBuilder: (BuildContext context) {
      return ProductActionBar(
        onAddToCart: addToCart,
        onPurchase: buy,
      );
    }).whenComplete(update);
  }

  openCurtainProductAttributeModal() {
    print(product.attribute.initialized);
    return curtainProductModal.openCurtainProductAttributeModal(Get.context!,
        product: product, addToCart: addToCart, buy: buy);
    // if (product.attribute.initialized) {
    //   return curtainProductModal.openCurtainProductAttributeModal(Get.context!,
    //       product: product, addToCart: addToCart, buy: buy);
    // }
    // return _repository
    //     .productAttribute({"goods_id": id})
    //     .then((value) {
    //       product.attribute = value;
    //     })
    //     .catchError((err) {})
    //     .then((value) {
    //       curtainProductModal.openCurtainProductAttributeModal(Get.context!,
    //           product: product, addToCart: addToCart, buy: buy);
    //     });
  }

  openRollingCurtainProductAttributeDialog() {
    return _repository.productAttribute({"goods_id": id}).then((value) {
      product.attribute = value;
    }).catchError((err, s) {
      print(err);
      print(s);
    }).then((value) {
      rollingCurtainProductDialog.openRollingCurtainProductAttributeDialog(
          Get.context!,
          product: product);
    });
  }

  openSectionalbarProductAttributeDialog() {
    return sectionalbarProductDialog.openSectionalbarProductAttributeDialog(
        Get.context!,
        product: product,
        buy: buy,
        addToCart: addToCart);
  }

  // Future addToCart() {
  //   CartRepository cartRepository = CartRepository();
  //   MatchingSetParamsEntity? matchingSet =
  //       product.productType is FabricCurtainProductType
  //           ? MatchingSetParamsEntity(
  //               attribute: (attribute as CurtainAttributeEntity).matchingSet)
  //           : null;
  //   AddToCartParamsEntity arg = AddToCartParamsEntity(
  //       product: product,
  //       finished: attribute.finished,
  //       matchingSet: matchingSet);

  //   if (arg.finished) {
  //     if (product.productType is! FinishedProductType) {
  //       saveMeasureData().then((value) {
  //         product.measureId = value;
  //         return cartRepository.addToCart(params: arg.params);
  //       });
  //     }
  //     product.specTip = "${product.currentSpecName} x${product.count}";
  //     return cartRepository.addToCart(params: arg.params);
  //   }
  //   return showAttributePicker();
  // }

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

  Future select() {
    return openSelectProductModal(Get.context!, product: product);
  }

  Future saveMeasureData() {
    if (product.productType is FinishedProductType) return Future.value(-1);
    ProductRepository repository = ProductRepository();

    MeasureDataParamsEntity arg =
        MeasureDataParamsEntity(measureData: product.attribute.measureData);
    return repository.saveMeasureData(arg.params).then(product.saveMeasureId);
  }

  Future addToCart() {
    CartRepository repository = CartRepository();
    AddToCartParamsEntity arg = AddToCartParamsEntity(product: product);
    if (arg.validate()) {
      return saveMeasureData().then((value) {
        repository.addToCart(params: arg.params);
      });
    }
    throw ArgumentError.value(arg, "参数错误");
  }

  Future? buy() {
    if (product.productType is FinishedProductType) {
      return Get.toNamed(AppRoutes.commitOrder,
          arguments: [product.adapt()], preventDuplicates: false);
    }
    MatchingSetParamsEntity arg =
        MatchingSetParamsEntity(attribute: product.attribute.matchingSet);

    if (arg.validate()) {
      return saveMeasureData().then((value) {
        product.args = arg.params;
        Get.toNamed(AppRoutes.commitOrder,
            arguments: [
              product.adapt(
                  attributes: (product.attribute.matchingSet.attributes
                      .map((e) => e.adapt())
                      .toList()))
            ],
            preventDuplicates: false);
      });
    }
  }

  @override
  Future loadMore({Map? params}) {
    return Get.find<CommendationController>(tag: "product-$id")
        .loadMore(params: params);
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<CurtainProductAttributeController>(
        tag: "${product.id}", force: true);
    Get.delete<CommendationController>(tag: "product-$id", force: true);
    Get.delete<ProductDetailController>(tag: "${product.id}");
    Get.delete<FinishedProductAttributeController>(
        tag: "${product.id}", force: true);
    Get.delete<FinishedProductAttributeController>(
        tag: "${product.id}", force: true);
    Get.delete<CurtainProductAttributeController>(
        tag: "${product.id}", force: true);
    Get.delete<RollingCurtainProductAttributeController>(
        tag: "${product.id}", force: true);
    Get.delete<SectionalbarController>(tag: "${product.id}", force: true);
  }
}
