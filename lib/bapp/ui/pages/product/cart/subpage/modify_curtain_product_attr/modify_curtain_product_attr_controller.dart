import 'dart:convert';

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/cart_product_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/cart_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/xdio/x_dio.dart';

class ModifyCurtainProductAttrController extends GetxController {
  String tag = Get.parameters["id"];

  CartPorductModel cart = Get.arguments;

  CurtainProductAtrrParamsModel args;

  Future confirm() {
    ProductRepository repository = ProductRepository();
    CurtainProductAtrrParamsModel args =
        CurtainProductAtrrParamsModel(tag: tag);

    return repository.modifyProductAttr(params: {
      "cart_id": tag,
      "wc_attr": jsonEncode(args.params)
    }).then((BaseResponse response) {
      Get.find<CartListController>(tag: Get.parameters["tab"])
          .loadData()
          .then((_) {
        Get.back();
      });
    }).catchError((err) {});
  }

  @override
  void onInit() {
    super.onInit();
  }
}
