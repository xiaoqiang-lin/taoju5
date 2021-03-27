/*
 * @Description: 软装方案详情
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:53:11
 * @LastEditTime: 2021-01-09 19:54:52
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';

class SoftProductDetailController extends GetxController {
  ProductRepository _repository = ProductRepository();

  String get id => Get.parameters["id"];
  String get productId => Get.parameters["fromId"];
  XLoadState loadState = XLoadState.idle;

  List<DesignProductModel> productList = [];

  Future loadData() {
    loadState = XLoadState.busy;
    update();
    return _repository.softDesignProducList(
        params: {"goods_id": productId, "scenes_id": id}).then((value) {
      productList = value;
      if (GetUtils.isNullOrBlank(productList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    loadData();

    super.onInit();
  }
}
