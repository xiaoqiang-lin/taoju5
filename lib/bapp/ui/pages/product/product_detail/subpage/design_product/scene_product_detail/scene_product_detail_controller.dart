/*
 * @Description: 场景详情控制器 逻辑处理
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:49:16
 * @LastEditTime: 2021-01-28 14:31:14
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_detail_model.dart';

import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';

import '../design_product_detail_controller.dart';

class SceneProductDetailController extends DesignProductDetailController {
  final id = Get.parameters["id"];

  XLoadState loadState = XLoadState.idle;
  Future loadData() {
    loadState = XLoadState.busy;
    update();
    return repository.sceneDesignProductDetail(params: {"scenes_id": id}).then(
        (DesignProductDetailModelWrapper value) {
      product = value.product;
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }
}
