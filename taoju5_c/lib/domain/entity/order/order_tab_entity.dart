/*
 * @Description: sho
 * @Author: iamsmiling
 * @Date: 2021-05-17 16:50:40
 * @LastEditTime: 2021-05-18 18:01:00
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/res/R.dart';

class OrderTabEntity {
  late String label;
  late String status;

  late bool visible;
  int count = 0;
  String get icon =>
      {
        "待测量": R.image.toBeMeasured,
        "待付款": R.image.toBePaid,
        "待选品": R.image.toBeSelected,
        "待发货": R.image.toBeDelivered,
        "待安装": R.image.toBeInstalled
      }[label] ??
      "";

  OrderTabEntity.fromJson(Map json) {
    label = json["status_name"];
    status = json["status"];
    count = json["count"];
    visible = JsonKit.asBool(json["visible"]);
  }
}
