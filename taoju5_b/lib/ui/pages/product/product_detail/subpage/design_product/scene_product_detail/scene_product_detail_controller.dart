/*
 * @Description: 场景详情控制器 逻辑处理
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:49:16
 * @LastEditTime: 2021-01-28 14:31:14
 */

import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/product/design_product_detail_model.dart';
import 'package:taoju5_b/domain/model/product/design_product_model.dart';
import 'package:taoju5_b/ui/widgets/base/x_view_state.dart';

import '../design_product_detail_controller.dart';

class SceneProductDetailController extends DesignProductDetailController {
  String id;
  String tag;
  List<DesignProductModel> sceneList;

  XLoadState loadState = XLoadState.idle;
  Future loadData() {
    loadState = XLoadState.busy;
    update();
    return repository.sceneDesignProductDetail(params: {"scenes_id": id}).then(
        (DesignProductDetailModelWrapper value) {
      product = value.product;
      sceneList = value.sceneList;
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    id = Get.parameters["id"];
    tag = Get.parameters["fromId"];
    loadData();
    super.onInit();
  }
}
