/*
 * @Description: 数据看版
 * @Author: iamsmiling
 * @Date: 2021-01-07 10:28:42
 * @LastEditTime: 2021-01-07 10:32:10
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/dats_dash_board_controller.dart';

class DataDashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataDashBoardController());
  }
}
