/*
 * @Description: 设计类产品
 * @Author: iamsmiling
 * @Date: 2021-01-23 16:20:14
 * @LastEditTime: 2021-01-23 16:24:42
 */
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/modal/product/design_product/design_product_modal.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_list/customer_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class DesignProductDetailController extends GetxController {
  ProductRepository repository = ProductRepository();
  DesignProductDetailModel product;
  List<ProductModel> list;
  String id;
  String fromId;

  Future loadData();

  commit() {}

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future openDesignProductModal({@required String fromId}) {
    if (Get.find<CustomerProviderController>().isCustomerNull) {
      EasyLoading.showInfo("请先选择客户哦");
      return Get.toNamed(BAppRoutes.customerEdit,
          arguments: ChooseCustomerEventModel(fromUrl: Get.currentRoute));
    }
    return showDesignProductModal(id: id, fromId: fromId);
  }
}
