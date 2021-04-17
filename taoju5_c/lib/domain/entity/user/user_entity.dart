/*
 * @Description: 用户模型
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-17 17:44:12
 */
import 'package:taoju5_bc/utils/json_kit.dart';

class UserEntity {
  String name;
  String avatar;
  String account;
  String telephone;
  int id;
  String birthday;

  UserEntity.fromJson(Map json) {
    assert(json is Map);
    name = json["user_name"];
    avatar = JsonKit.asWebUrl(json["user_headimg"]);
    telephone = json["user_tel"];
    account = json["account"] ?? telephone;
    birthday = json["user_birth"];
  }

  UserEntity.smaple() {
    id = 1;
    name = "小居友-T1J23456";
    account = "13588414007";
    avatar = "https://i.loli.net/2021/04/13/t3M15Z8oQCSLAgb.png";
  }
}
