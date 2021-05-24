/*
 * @Description: 售后
 * @Author: iamsmiling
 * @Date: 2021-05-20 15:01:29
 * @LastEditTime: 2021-05-24 15:53:24
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';

class AftersellController extends GetxController {
  OrderDetailEntity order = Get.arguments;

  List<Widget> images = [];

  Future submit() {
    return Future.value(true);
  }
}
