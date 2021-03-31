/*
 * @Description: 控制器
 * @Author: iamsmiling
 * @Date: 2021-01-15 23:03:21
 * @LastEditTime: 2021-01-23 13:34:06
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/cart_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/modal/product/finished_product.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/cart_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taoju5/xdio/x_dio.dart';

class FinishedProductAttrsController extends GetxController {
  ProductDetailModel product;
  CartPorductModel cartProduct;
  String id;
  FinishedProductAttrsController(
      {this.product, @required this.id, this.cartProduct});

  ProductRepository _repository = ProductRepository();
  XLoadState loadState = XLoadState.busy;

  ///当前选中的规则属性
  String get currentSpecValue => product.currentSpecOptionName;

  Future closeModal() async {
    product.material = product.materialUsed;
    Get.back();
    update();
    if (Get.isRegistered<ProductDetailController>(tag: id)) {
      Get.find<ProductDetailController>(tag: id).updateTotalPrice();
    }
  }

  void _initWithCartProduct() {
    if (cartProduct != null && !GetUtils.isNullOrBlank(product.skuList)) {
      ProductSkuModel sku = product.skuList.firstWhere(
          (e) => e.id == cartProduct.skuId,
          orElse: () => product.skuList?.first);
      product.specList.forEach((e) {
        e.optionList.forEach((o) {
          o.isChecked = sku.name.contains(o.name);
        });
      });
      product.count = cartProduct.count.value;
    }
  }

  Future modifyCartProductAttr() {
    return _repository.modifyProuductAttrInCart(params: {
      "sku_id": product?.currentSku?.id,
      "num": product?.count,
      "cart_id": cartProduct?.id,
      "material": cartProduct?.length
    }).then((value) {
      _refreshDataAfterModify();
    });
  }

  void _refreshDataAfterModify() {
    String tag = cartProduct.categoryType;
    if (Get.isRegistered<CartListController>(tag: tag)) {
      cartProduct?.count?.value = product?.count;
      cartProduct?.skuId = product?.currentSku?.id;
      cartProduct?.productPrice = product?.currentSku?.price;
      cartProduct?.description = product?.currentSku?.name;
      cartProduct?.image = product?.currentSku?.image;
      Get.find<CartListController>(tag: tag).update();
    }
    Get.back();
  }

  Future onConfirm() {
    return modifyCartProductAttr();
  }

  Future loadData() {
    loadState = XLoadState.busy;
    update();
    return _repository.productDetail(params: {"goods_id": id}).then(
        (ProductDetailModelWrapper wrapper) {
      product = wrapper.product;

      _initWithCartProduct();
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  void select(
      {@required ProductSpecModel spec,
      @required ProductSpecOptionModel option}) {
    if (spec?.isMultiple ?? false) {
      option.isChecked = !option.isChecked;
    } else {
      spec.optionList.forEach((e) {
        e.isChecked = e == option;
      });
    }
    update();
  }

  void setMaterialUsed(String val) {
    if (!GetUtils.isNum(val)) {
      EasyLoading.showInfo("请输入正确的数值哦");
    } else {
      product.materialUsed = val;
      cartProduct?.length = val;
    }
    update(["header"]);
  }

  @override
  void onInit() {
    if (Get.isRegistered<ProductDetailController>(tag: id)) {
      product = Get.find<ProductDetailController>(tag: id).product;

      loadState = XLoadState.idle;
      update();
    }
    if (product == null) {
      loadData();
    }
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
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
    update(["header"]);
  }

  Future addToCart() {
    AddToCartParamsModel args = AddToCartParamsModel(
      tag: id,
      product: product,
      totalPrice: "${(product?.price ?? 0) * product?.count}",
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

  Future openFinishedProductAttrModal(BuildContext context,
      {ProductDetailModel product,
      CartPorductModel cartProduct,
      String id,
      Function onConfirm}) {
    return showFinishedProductAttrModal(context,
            product: product, id: id, onConfirm: onConfirm)
        .then((value) {
      Get.find<ProductDetailController>(tag: id).update();
    });
  }
}
