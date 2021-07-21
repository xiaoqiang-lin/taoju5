/*
 * @Description: 门店详情
 * @Author: iamsmiling
 * @Date: 2021-07-21 14:19:38
 * @LastEditTime: 2021-07-21 15:25:52
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class StoreDetailEntity {
  late int id;
  late String name;
  late String avatar;
  late String image;
  late String description;
  late String distance;
  late String telephone;
  late String bussinessHours;
  late String score;
  late String address;

  StoreDetailEntity.fromJson(Map json) {
    id = json["shop_id"];
    name = json["shop_name"];
    avatar = JsonKit.asWebUrl(json["shop_avatar"]);
    image = JsonKit.asWebUrl(json["image"]);
    description = json["shop_collect"];
    distance = json["distance"];
    telephone = json["shop_phone"];
    bussinessHours = json["shop_workingtime"];
    score = "${json["grade"]}";
    address = "${json["all_address"]}".replaceAll(" ", "");
  }
}
