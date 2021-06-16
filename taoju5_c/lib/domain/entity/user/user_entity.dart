/*
 * @Description: 用户模型
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-06-07 14:44:55
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';

enum Gender { unknow, male, female }

extension GenderKit on Gender {
  int get code =>
      {Gender.unknow: 0, Gender.male: 1, Gender.female: 2}[this] ?? 0;

  String get name =>
      {Gender.unknow: "未选择", Gender.male: "男", Gender.female: "女"}[this] ??
      "未知";
}

///注册类型
enum RegisterType { wechat, telephone }

getRegisterType(int code) => [];

class UserEntity {
  late String name;
  late String avatar;
  late String account;
  late String telephone;
  late Gender gender;
  late String? birthday;
  late int registerTypeCode;
  late List<OrderTabEntity> kongos;
  late bool isPasswordEmpty;

  RegisterType get registerType =>
      {1: RegisterType.telephone, 2: RegisterType.wechat}[registerTypeCode] ??
      RegisterType.telephone;

  UserEntity.fromJson(Map json) {
    assert(json is Map);
    name = json["user_name"];
    avatar = JsonKit.asWebUrl(json["user_headimg"]);
    telephone = json["user_tel"];
    account = json["account"] ?? telephone;
    birthday = json["user_birth"];
    gender = Gender.female;
    registerTypeCode = json["registered_type"];
    kongos = JsonKit.asList(json["status"])
        .map((e) => OrderTabEntity.fromJson(e))
        .toList();
    isPasswordEmpty = "${json["is_set_password"]}" == "1";
  }

  UserEntity.smaple() {
    name = "小居友-T1J23456";
    account = "13588414007";
    avatar = "https://i.loli.net/2021/04/13/t3M15Z8oQCSLAgb.png";
    gender = Gender.female;
    birthday = "1998-01-25";
  }
}
