/*
 * @Description: 购物车
 * @Author: iamsmiling
 * @Date: 2020-12-28 10:29:31
 * @LastEditTime: 2021-01-16 15:59:10
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_type.dart';
import 'package:taoju5/bapp/domain/model/product/cart_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_adapter_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_tab_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/dialog/product/cart/remove_from_cart.dart';

import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/bapp/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taoju5/utils/common_kit.dart';

class CartListParentController extends GetxController
    with SingleGetTickerProviderMixin {
  List<ProductTabModel> tabList = [
    ProductTabModel(name: "全部", id: 0),
    ProductTabModel(name: "窗帘", id: 2),
    ProductTabModel(name: "床品", id: 22),
    ProductTabModel(name: "抱枕", id: 1),
    ProductTabModel(name: "沙发", id: 23),
    ProductTabModel(name: "搭毯", id: 3),
  ];

  XLoadState loadState = XLoadState.busy;

  TabController tabController;

  double totalPrice = 0.0;

  bool isInEditMode = false;

  void switchMode() {
    isInEditMode = !isInEditMode;
    update(["editMode", "totalPrice", "buttonBar"]);
  }

  CartListParentController();

  String get tag => "${tabList[tabController?.index ?? 0].id}";
  CartListController get cartListController =>
      Get.find<CartListController>(tag: tag);
  List<CartPorductModel> get cartList => cartListController.cartList;
  // get totalPrice => cartList.totalPrice.obs;
  bool get isCheckedAll => cartListController.isCheckedAll;

  set isCheckedAll(bool flag) {
    cartListController.cartList.forEach((e) {
      e.isChecked.value = flag;
    });
    totalPrice = cartListController.totalPrice;
    update(["isCheckedAll", "totalPrice"]);
    // cartListController.isCheckedAll = flag;
  }

  void batchRemove() {
    cartListController.remove(tag: tag);
  }

  void commit() {
    cartListController.commit();
  }

  void tabChangeListener() {
    isCheckedAll = cartListController.isCheckedAll;
    totalPrice = cartListController.totalPrice;
    update(["action", "isCheckedAll", "totalPrice"]);
  }

  Future loadData({bool reInitTabController}) {
    ProductRepository _repository = ProductRepository();
    loadState = XLoadState.busy;
    update();
    return _repository.cartCategory(params: {
      "client_uid": Get.parameters["customerId"]
    }).then((List<ProductTabModel> value) {
      tabList = value;
      if (reInitTabController) {
        tabController = TabController(
          length: tabList.length,
          vsync: this,
        )..addListener(tabChangeListener);
      }
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(() {
      update(["tab", "buttonBar"]);
    });
  }

  @override
  void onInit() {
    tabController = TabController(
      length: tabList.length,
      vsync: this,
    )..addListener(tabChangeListener);
    loadData(reInitTabController: true);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.removeListener(tabChangeListener);
    tabController?.dispose();
    super.onClose();
  }
}

class CartListController extends GetxController {
  ProductRepository _repository = ProductRepository();

  CartListController({@required this.type});

  String get clientId =>
      Get.parameters["customerId"] ?? Get.find<CustomerProviderController>().id;
  final String type;
  List<CartPorductModel> cartList = [];

  List<CartPorductModel> get checkedCartList {
    if (GetUtils.isNullOrBlank(cartList)) return [];
    return cartList?.where((e) => e.isChecked.value)?.toList();
  }

  List<ProductAdapterModel> get orderProductList =>
      checkedCartList.map((e) => e.adapt()).toList();

  double get totalPrice {
    if (GetUtils.isNullOrBlank(checkedCartList)) return 0;
    return checkedCartList.map((e) => e.totalPrice)?.reduce((a, b) => a + b);
  }

  set isCheckedAll(bool flag) {
    for (CartPorductModel e in cartList) {
      e.isChecked.value = flag;
    }
  }

  bool get isCheckedAll {
    if (GetUtils.isNullOrBlank(cartList)) return false;

    ///任意一个[checked]属性为[false]则不是全选
    return !cartList.any((e) => e.isChecked.value == false);
  }

  CartListParentController parentController =
      Get.find<CartListParentController>();

  void checkItem(CartPorductModel model, bool flag) {
    model.isChecked.value = flag;

    parentController.totalPrice = totalPrice;

    parentController.update(["totalPrice", "isCheckedAll"]);
  }

  List<ProductAdapterModel> get checkedProductList {
    if (GetUtils.isNullOrBlank(cartList)) return [];
    return cartList
        .where((e) => e.isChecked.value)
        .map((e) => e.adapt())
        .toList();
  }

  commit() {
    if (GetUtils.isNullOrBlank(checkedProductList)) {
      EasyLoading.showInfo("当前暂未选中商品哦");
      return;
    }
    Get.toNamed(BAppRoutes.commitOrder,
        arguments: CommitOrderEvent(
            productList: checkedProductList,
            orderType: OrderType.selectionOrder));
  }

  void onProductCountChange(CartPorductModel e, String val) {
    if (GetUtils.isNum(val)) {
      e.count.value = int.parse(val);
    } else {
      e.count.value = 1;
    }
    parentController.totalPrice = totalPrice;

    _repository.modifyProuductCountInCart(params: {
      "sku_id": e.skuId,
      "cart_id": e.id,
      "num": e.count
    }).then((value) {
      Get.find<CartListParentController>().update(["totalPrice"]);
    });
  }

  Future modifySectionalbarLength(CartPorductModel e) {
    if (CommonKit.isNullOrZero(e.length)) {
      EasyLoading.showInfo("请输入型材米数哦");
      throw Future.error(false);
    }
    return _repository.modifyProuductCountInCart(params: {
      "sku_id": e.skuId,
      "cart_id": e.id,
      "num": e.productType is SectionalbarProductType ? e.length : e.count,
      "material": e.length,
      "type": 2
    }).then((value) {
      e.description = "用料:${e.length}米";
      parentController.totalPrice = totalPrice;
      parentController.update(["totalPrice"]);
      update(["${e.id}"]);
      Get.back();
    });
  }

  XLoadState loadState = XLoadState.idle;
  Future loadData({bool shouldRefreshUI = true}) {
    loadState = XLoadState.busy;
    if (shouldRefreshUI) {
      update();
    }

    return _repository
        .cartList(params: {"client_uid": clientId, "category_id": type}).then(
            (CartPorductModelListWrapper value) {
      value.list.forEach((e) {
        e.categoryType = type;
      });
      cartList = value.list;
      if (GetUtils.isNullOrBlank(cartList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  Future removeFromCart() {
    Map params = {
      "cart_id_array": checkedCartList.map((e) => e.id).join(","),
      "client_uid": clientId
    };
    return _repository.removeFromCart(params: params).then((value) {
      removeFromList();
      Get.find<CustomerProviderController>().refreshData();
      CartListParentController parentController =
          Get.find<CartListParentController>();
      parentController.loadData();
      if (GetUtils.isNullOrBlank(cartList)) {
        loadState = XLoadState.empty;
        parentController.isCheckedAll = false;
        parentController.update(["isCheckedAll"]);
        update();
      }
    }).whenComplete(update);
  }

  void removeFromList() {
    // for (CartPorductModel e in cartList) {
    //   if (e.isChecked.value) {
    //     cartList.remove(e);
    //   }
    // }
    if (GetUtils.isNullOrBlank(cartList)) return;

    for (int i = 0; i < cartList.length; i++) {
      cartList[i].hasDeleted = cartList[i].isChecked.value;
    }

    cartList = cartList.where((e) => !e.hasDeleted).toList();
  }

  Future remove({CartPorductModel element, @required String tag}) {
    if (element != null) {
      checkItem(element, true);
    }
    if (GetUtils.isNullOrBlank(checkedCartList)) {
      EasyLoading.showInfo("当前暂未选中商品哦");
      return Future.value(false);
    }
    return showRemoveFromCartDialog(tag);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
