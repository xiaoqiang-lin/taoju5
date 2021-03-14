/*
 * @Description: 控制器
 * @Author: iamsmiling
 * @Date: 2021-01-15 23:03:21
 * @LastEditTime: 2021-01-23 13:34:06
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taoju5/xdio/x_dio.dart';

class FinishedProductAttrsController extends GetxController {
  ProductDetailModel product;
  String id;
  FinishedProductAttrsController({this.product, @required this.id});

  ProductRepository _repository = ProductRepository();
  XLoadState loadState = XLoadState.idle;

  ///当前选中的规则属性
  String get currentSpecValue => product.currentSpecOptionName;

  Future _loadData() {
    loadState = XLoadState.busy;
    update();
    return _repository.productDetail(params: {"goods_id": id}).then(
        (ProductDetailModelWrapper wrapper) {
      product = wrapper.product;
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  void select(
      {@required ProductSpecModel spec,
      @required ProductSpecOptionModel option}) {
    if (spec.isMultiple) {
      option.isChecked = !option.isChecked;
    } else {
      spec.optionList.forEach((e) {
        e.isChecked = e == option;
      });
    }
    update();
  }

  @override
  void onInit() {
    if (Get.isRegistered<ProductDetailController>(tag: id)) {
      product = Get.find<ProductDetailController>(tag: id).product;
    }
    if (product == null) {
      _loadData();
    }
    super.onInit();
  }

  bool checkSpec() {
    List<bool> list = [];

    for (ProductSpecModel spec in product.specList) {
      bool flag = spec.optionList.any((e) => e.isChecked);
      if (!flag) {
        EasyLoading.showInfo("请选择${spec.name}");
        return false;
      } else {
        list.add(flag);
      }
    }
    return list.any((e) => !e);
  }

  void changeProductCount(String val) {
    if (GetUtils.isNum(val)) {
      product.count = int.parse(val);
    } else {
      product.count = 1;
    }
  }

  Future addToCart() {
    AddToCartParamsModel args = AddToCartParamsModel(
      tag: id,
      product: product,
      totalPrice: "${product.price * product.count}",
    );
    return _repository
        .addToCart(params: args.params)
        .then((BaseResponse response) {
      CustomerProviderController customerController =
          Get.find<CustomerProviderController>();
      customerController.updateCartCount("${response.data}");
      Get.back();
    });
  }
}
