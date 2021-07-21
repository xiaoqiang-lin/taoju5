/*
 * @Description: cart
 * @Author: iamsmiling
 * @Date: 2021-04-21 14:33:06
 * @LastEditTime: 2021-07-20 10:47:01
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/net/chimera_refresh_builder.dart';
import 'package:taoju5_c/domain/entity/cart/cart_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/repository/cart_repository.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/dialog/sectionalbar_product_attribute/sectionalbar_product_attribute_dialog.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/open_finished_product_attribute_modal.dart'
    as modal;
import 'package:taoju5_c/utils/toast.dart';

import 'dialog/remove_from_cart_dialog.dart' as dialog;

class CartController extends ChimeraRefreshController<List<CartEntity>> {
  CartRepository _repository = CartRepository();

  // List<CartEntity> carts = [];

  List<CartEntity> carts = <CartEntity>[];

  RxList<CartEntity> selectedCarts = (<CartEntity>[]).obs;

  @override
  void onInit() {
    super.onInit();

    Get.lazyPut(() => CommendationController(controller: refreshController),
        tag: "cart");
  }

  @override
  Future<List<CartEntity>> loadData({Map? params}) {
    return _repository.cartList().then((value) {
      carts = value;
      return value;
    });
  }

  Future openRemoveFromCartDialog(CartEntity cart) {
    return dialog.openRemoveFromCartDialog(Get.context!,
        onMoveToCollection: () {},
        onRemoveFromCart: () => removeFromCart(cart).whenComplete(Get.back));
  }

  Future removeFromCart(CartEntity cart) {
    ToastKit.loading();

    return _repository
        .removeFromCart(params: {"cart_id": cart.id}).then((value) {
      cart.removed = true;
      carts = carts.where((e) => !e.removed).toList();
      // carts = value;
      if (carts.isEmpty) {
        change([], status: RxStatus.empty());
      }
      return value;
    }).whenComplete(() {
      ToastKit.dismiss();
      update();
    });
  }

  Future openFinishedProductAttributeModal(CartEntity cart) {
    if (cart.productType is SectionbarProductType) {
      ProductDetailEntity product = ProductDetailEntity();
      product.length = cart.length;
      product.count = cart.count;
      product.price = cart.unitPrice;

      return openSectionalbarProductAttributeDialog(Get.context!,
          product: product, footerBuilder: (BuildContext context) {
        return Container(
          alignment: Alignment.center,
          child: PrimaryButton(
            text: "确定",
            onPressed: () => modifySectionalbarAttribute(cart, product),
            size: PrimaryButtonSize.large,
          ),
        );
      });
    }
    ProductRepository productRepository = ProductRepository();

    return productRepository.productDetailWithSkuId({
      "goods_id": cart.productId,
      "sku_id": cart.skuId
    }).then((ProductDetailEntity product) {
      product.count = cart.count;

      modal.openFinishedProductAttributeModal(Get.context!, product: product,
          actionBuilder: (BuildContext context) {
        return PrimaryButton(
          text: "确定",
          onPressed: () => modifyCartSku(cart, product),
          constraints:
              BoxConstraints(minHeight: R.dimen.dp45, minWidth: R.dimen.dp200),
        );
      });
    });
  }

  void select(CartEntity cart, bool checked) {
    cart.checked = checked;
    update();
    selectedCarts.value = carts.where((e) => e.checked).toList();
  }

  double get totalPrice {
    if (selectedCarts.isEmpty) return 0;
    double s = 0;
    selectedCarts.forEach((e) {
      s += e.totalPrice;
    });
    return s;
  }

  bool get checkedAll => carts.isEmpty ? false : carts.every((e) => e.checked);

  List<ProductAdaptorEntity> get selectedProducts => selectedCarts
      .where((e) => e.checked)
      .map((e) => ProductAdaptorEntity.fromCartEntity(e))
      .toList();

  void selectAll(bool flag) {
    carts.forEach((e) {
      e.checked = flag;
    });
    update();
    selectedCarts.value = carts.where((e) => e.checked).toList();
    // checkedAll.value = carts.every((e) => e.checked);
  }

  Future modifyCartCount(CartEntity cart, int count) {
    return _repository.modifyCartCount(params: {
      "num": count,
      "cart_id": cart.id,
      "sku_id": cart.skuId,
    }).then((value) {
      cart.count = count;
      // cart.totalPrice = value;
      Get.back();
    });
  }

  Future modifyCartSku(CartEntity cart, ProductDetailEntity product) {
    return _repository.modifyCartSku(params: {
      "num": product.count,
      "cart_id": cart.id,
      "sku_id": product.currentSku?.id,
      "length": product.length
    }).then((value) {
      cart.reAssign(value);
      Get.back();
    }).whenComplete(update);
  }

  ///修改型材属性
  Future modifySectionalbarAttribute(
      CartEntity cart, ProductDetailEntity product) {
    return _repository.modifyCartSku(params: {
      "num": product.count,
      "cart_id": cart.id,
      "sku_id": cart.skuId,
      "length": product.length
    }).then((value) {
      cart.reAssign(value);
      Get.back();
    }).whenComplete(update);
  }

  @override
  Future loadMore({Map? params}) {
    return Get.find<CommendationController>(tag: "cart").loadMore();
  }

  @override
  Future refreshData() {
    return loadData().then((value) {
      refreshController.refreshCompleted();
    }).catchError((err, s) {
      refreshController.refreshFailed();
    }).whenComplete(update);
  }
}
