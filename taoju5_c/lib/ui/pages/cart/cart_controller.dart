/*
 * @Description: cart
 * @Author: iamsmiling
 * @Date: 2021-04-21 14:33:06
 * @LastEditTime: 2021-08-06 10:15:06
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/net/chimera_refresh_builder.dart';
import 'package:taoju5_c/domain/entity/cart/cart_entity.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/repository/cart_repository.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/dialog/rolling_curtain_product_attribute/rolling_curtain_product_controller.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/dialog/sectionalbar_product_attribute/sectionalbar_product_attribute_dialog.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/curtain_product_attribute_modal/curtain_product_attribute_controller.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/finished_product_attribute_modal/finished_product_attribute_modal_controller.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/open_curtain_product_attribute_modal.dart'
    as curtainAttributeModal;
import 'package:taoju5_c/ui/pages/product/product_detail/modal/open_finished_product_attribute_modal.dart'
    as modal;

import 'dialog/remove_from_cart_dialog.dart' as dialog;

class CartController extends ChimeraRefreshController<List<CartEntity>> {
  CartRepository _repository = CartRepository();

  // List<CartEntity> carts = [];

  List<CartEntity> carts = <CartEntity>[];

  RxList<CartEntity> selectedCarts = (<CartEntity>[]).obs;

  bool editing = false;

  int totalPage1 = double.maxFinite ~/ 1;

  int totalCount = 0;

  int pageIndex = 1;

  ///推荐模块是否可见
  bool recommended = false;

  @override
  void onInit() {
    super.onInit();

    Get.lazyPut(() => CommendationController(controller: refreshController),
        tag: "cart");
    Get.lazyPut(() => CommendationController(controller: refreshController),
        tag: "emptyCart");
  }

  @override
  Future<List<CartEntity>> loadData({Map? params}) {
    return _repository.cartList(params: params).then((value) {
      carts.addAll(value.list);
      totalPage1 = value.totalPage;
      totalCount = value.totalCount;
      recommended = carts.isEmpty;
      return value.list;
    });
  }

  void edit() {
    editing = !editing;
    update();
  }

  Future openRemoveFromCartDialog(CartEntity cart) {
    return dialog.openRemoveFromCartDialog(Get.context!,
        onMoveToCollection: () {},
        onRemoveFromCart: () => removeFromCart(cart).whenComplete(Get.back));
  }

  Future removeFromCart(CartEntity cart) {
    // ToastKit.loading();

    return _repository
        .removeFromCart(params: {"cart_id": cart.id}).then((value) {
      // change(carts, status: RxStatus.loading());
      // refreshData();
      // cart.removed = true;
      // carts = carts.where((e) => !e.removed).toList();
      // // carts = value;
      // if (carts.isEmpty) {
      //   change([], status: RxStatus.empty());
      // }
      // refreshController.requestRefresh();
      // return value;
      refreshData();
    });
  }

  Future openFinishedProductAttributeModal(CartEntity cart) async {
    ProductDetailEntity product = ProductDetailEntity.fromCartEntity(cart);
    if (cart.productType is SectionbarProductType) {
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
    return modal.openFinishedProductAttributeModal(Get.context!,
        product: product, actionBuilder: (BuildContext context) {
      return PrimaryButton(
        text: "确定",
        onPressed: () => modifyCartSku(cart, product),
        constraints:
            BoxConstraints(minHeight: R.dimen.dp45, minWidth: R.dimen.dp200),
      );
    });
  }

  Future openCurtainProductAttributeModal(CartEntity cart) async {
    if (cart.measureData == null) {
      await _repository
          .measureData(params: {"measure_id": cart.measureId}).then((value) {
        cart.measureData = value;
      });
    }

    ProductDetailEntity product = ProductDetailEntity.fromCartEntity(cart);
    // await
    // CurtainMeasureDataAttributeEntity
    return curtainAttributeModal.openCurtainProductAttributeModal(Get.context!,
        product: product,
        actionBar: PrimaryButton(
          text: "确定",
          // onPressed: () => _modifyProductAttribute(p, product),
          constraints: BoxConstraints(
              minHeight: R.dimen.dp45,
              minWidth: R.dimen.dp200,
              maxHeight: R.dimen.dp45,
              maxWidth: R.dimen.dp200),
        ));
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
    pageIndex++;
    if (pageIndex > totalPage1 &&
        Get.isRegistered<CommendationController>(tag: "cart")) {
      recommended = true;
      update(["recommend"]);
      CommendationController c = Get.find<CommendationController>(tag: "cart");
      if (!c.initialized) {
        c.loadData();
      }
      return c.loadMore();
    }
    return _loadMoreCarts();
  }

  Future _loadMoreCarts() {
    return loadData(params: {"page_index": pageIndex, "page_size": 10})
        .then((value) {
      carts.addAll(value);
      recommended = carts.isEmpty;
      refreshController.loadComplete();
    }).catchError((err, s) {
      pageIndex--;
      refreshController.loadFailed();
    }).whenComplete(update);
  }

  @override
  Future refreshData() {
    return loadData().then((value) {
      carts = value;
      selectedCarts.value = [];
      refreshController.refreshCompleted();
    }).catchError((err, s) {
      refreshController.refreshFailed();
    }).whenComplete(update);
  }

  Future batchRemove() {
    String id = carts.where((e) => e.checked).map((e) => e.id).join(",");
    // ToastKit.loading();
    return _repository.removeFromCart(params: {"cart_id": id}).then((value) {
      // change(carts, status: RxStatus.loading());
      // refreshData();
      // cart.removed = true;
      // carts = carts.where((e) => !e.removed).toList();
      // // carts = value;
      // if (carts.isEmpty) {
      //   change([], status: RxStatus.empty());
      // }
      // refreshController.requestRefresh();
      // return value;
      refreshData();
    });
  }

  @override
  void onClose() {
    for (CartEntity c in carts) {
      Get.delete<FinishedProductAttributeController>(
          tag: "${c.productId}", force: true);
      Get.delete<CurtainProductAttributeController>(
          tag: "${c.productId}", force: true);
      Get.delete<RollingCurtainProductAttributeController>(
          tag: "${c.productId}", force: true);
      Get.delete<SectionalbarController>(tag: "${c.productId}", force: true);
    }
    super.onClose();
  }
}
