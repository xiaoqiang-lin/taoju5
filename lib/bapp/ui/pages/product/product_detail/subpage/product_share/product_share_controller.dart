/*
 * @Description: 产品分享controller
 * @Author: iamsmiling
 * @Date: 2021-01-20 13:22:25
 * @LastEditTime: 2021-01-25 09:49:51
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';

class ProductShareController extends GetxController {
  ProductRepository _repository = ProductRepository();
  XLoadState loadState = XLoadState.idle;

  ProductDetailModel product;
  String mainImg;

  String get id => Get.parameters["id"];

  ScrollController scrollController;

  void loadData() {
    loadState = XLoadState.busy;
    update();
    _repository.productWebDetail(params: {"goods_id": id}).then(
        (ProductDetailModelWrapper wrapper) {
      loadState = XLoadState.idle;
      product = wrapper.product;
      mainImg = wrapper.mainImg;
      scrollController = ScrollController();
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController?.dispose();
    super.onClose();
  }
}
