/*
 * @Description: 首页banner图
 * @Author: iamsmiling
 * @Date: 2021-07-21 17:51:38
 * @LastEditTime: 2021-07-21 17:53:26
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class HomeAdEntity {
  late int instanceType;
  late int dataType;
  late String image;

  HomeAdEntity.fromJson(Map json) {
    instanceType = json["instance_type"];
    dataType = json["data_type"];
    image = JsonKit.asWebUrl(json["adv_image"]);
  }
}
