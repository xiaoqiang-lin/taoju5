import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/xdio/x_dio.dart';

class XLikeController extends GetxController {
  ProductRepository _repository = ProductRepository();

  String deactiveIcon = "assets/images/blank_heart.png";

  String activeIcon = "assets/images/filled_heart.png";

  bool isActive = false;

  CustomerProviderController customerController =
      Get.find<CustomerProviderController>();
  String productId = Get.parameters["id"];

  String get icon => isActive ? activeIcon : deactiveIcon;

  Map get params => {"fav_id": productId, "client_uid": customerController.id};

  Future loadData() {
    if (customerController.isCustomerNull) {
      return Future.value(false);
    }
    return _repository.isLiked(params: params).then((BaseResponse response) {
      if (response.isValid) {
        isActive = response.data > 0 ? true : false;
        print("1131$isActive");
      }
    }).whenComplete(update);
  }

  Future like() {
    if (isActive) {
      return _dislike();
    }
    return _like();
  }

  Future _like() {
    return _repository.like(params: params).then((value) {
      print("收藏成功");
      isActive = true;
      update();
    });
  }

  Future _dislike() {
    return _repository.dislike(params: params).then((value) {
      print("取消收藏成功");
      isActive = false;
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }
}

class XLikeButton extends StatelessWidget {
  const XLikeButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<XLikeController>(
      // init: XLikeController(),
      builder: (_) {
        return GestureDetector(onTap: _.like, child: Image.asset(_.icon));
      },
    );
  }
}
