/*
 * @Description: 软装方案详情
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:53:11
 * @LastEditTime: 2021-01-09 19:54:52
 */

import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/product/design_product_model.dart';
import 'package:taoju5_b/domain/repository/product/product_repository.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/subpage/design_product/design_product_detail_controller.dart';
import 'package:taoju5_b/ui/widgets/base/x_view_state.dart';

class SoftProductDetailController extends DesignProductDetailController {
  ProductRepository _repository = ProductRepository();

  String productId;
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
    super.onInit();
    productId = Get.parameters["fromId"];
    loadData();
  }
}
