/*
 * @Description: sho
 * @Author: iamsmiling
 * @Date: 2021-05-17 16:50:40
 * @LastEditTime: 2021-06-03 17:55:19
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class OrderTabEntity {
  late String label;
  late String status;

  late bool visible;
  late String icon;
  int count = 0;

  OrderTabEntity.fromJson(Map json) {
    label = json["status_name"];
    status = json["status"];
    count = json["num"];
    icon = JsonKit.asWebUrl(json["image"]);
    visible = JsonKit.asBool(json["visible"]);
  }
}
