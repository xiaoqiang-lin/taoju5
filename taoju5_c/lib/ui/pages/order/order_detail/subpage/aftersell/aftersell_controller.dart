/*
 * @Description: 售后
 * @Author: iamsmiling
 * @Date: 2021-05-20 15:01:29
 * @LastEditTime: 2021-07-12 15:10:53
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:dio/dio.dart' as dio;

class AftersellController extends GetxController {
  OrderDetailEntity order = Get.arguments;

  List<Widget> images = [];
  late dio.FormData formData = dio.FormData();

  Future submit() {
    return Future.value(true);
  }
}
