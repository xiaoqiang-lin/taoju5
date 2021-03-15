/*
 * @Description: 软装方案详情
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:53:11
 * @LastEditTime: 2021-01-09 19:54:52
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';

class SoftProductDetailController extends GetxController {
  final id = Get.arguments["id"];

  XLoadState loadState = XLoadState.idle;

  Future loadData() {
    return Future.value(false);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
