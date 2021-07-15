/*
 * @Description: cart
 * @Author: iamsmiling
 * @Date: 2021-04-21 14:33:06
 * @LastEditTime: 2021-07-05 09:55:05
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

  List<CartEntity> carts = [];

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
      return openSectionalbarProductAttributeDialog(Get.context!,
          product: product, footerBuilder: (BuildContext context) {
        return Container(
          alignment: Alignment.center,
          child: PrimaryButton(
            text: "确定",
            onPressed: () {},
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
          footerBuilder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: R.color.ffe5e5e5))),
          height: kBottomNavigationBarHeight,
          padding: EdgeInsets.symmetric(
              horizontal: R.dimen.dp20, vertical: R.dimen.dp7),
          margin: EdgeInsets.only(bottom: Get.mediaQuery.padding.bottom),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "小计：",
                    style: TextStyle(fontSize: R.dimen.sp12),
                  ),
                  Text(
                    "¥${product.totalPrice.toStringAsFixed(2)}",
                    key: ValueKey(product.totalPrice),
                    style: TextStyle(
                        color: R.color.ffff5005, fontSize: R.dimen.sp14),
                  )
                ],
              ),
              PrimaryButton(
                text: "确定",
                onPressed: () {},
                constraints: BoxConstraints(
                    minHeight: R.dimen.dp45, minWidth: R.dimen.dp200),
              )
            ],
          ),
        );
      });
    });
  }

  void select(CartEntity cart, bool checked) {
    cart.checked = checked;
    totalPrice.value = caculate();
    checkedAll.value = carts.every((e) => e.checked);
  }

  void selectAll(bool flag) {
    carts.forEach((e) {
      e.checked = flag;
      print("全选----$flag");
    });
    checkedAll.value = flag;
    totalPrice.value = caculate();
    update();
    // checkedAll.value = carts.every((e) => e.checked);
  }

  Future modifyCartCount(CartEntity cart, int count) {
    return _repository.modifyCartCount(params: {
      "num": count,
      "cart_id": cart.id,
      "sku_id": cart.skuId
    }).then((value) {
      cart.count = count;
      cart.totalPrice = value;
      totalPrice.value = caculate();
    });
  }

  final totalPrice = 0.0.obs;
  final checkedAll = false.obs;

  ///计算总价
  double caculate() {
    double t = 0;
    for (int i = 0; i < carts.length; i++) {
      CartEntity item = carts[i];
      double price = !item.checked
          ? 0
          : item.productType is FinishedProductType
              ? item.unitPrice * item.count
              : item.totalPrice;
      t += price;
    }
    print("总价");
    print(t);
    return t;
  }

  List<ProductAdaptorEntity> get selectedProducts => carts
      .where((e) => e.checked)
      .map((e) => ProductAdaptorEntity.fromCartEntity(e))
      .toList();

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
