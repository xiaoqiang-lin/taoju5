/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-06-07 09:51:15
 * @LastEditTime: 2021-07-26 10:36:09
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/main/main_binding.dart';
import 'package:taoju5_b/ui/pages/home/home_binding.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    ///C 端依赖
    MainBinding().dependencies();

    ///B 端依赖
    TaojuwuBinding().dependencies();
  }
}
