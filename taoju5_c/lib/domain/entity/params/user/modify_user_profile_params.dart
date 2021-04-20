/*
 * @Description: 修改用户信息参数
 * @Author: iamsmiling
 * @Date: 2021-04-19 14:25:46
 * @LastEditTime: 2021-04-19 20:42:18
 */

import 'dart:convert';

import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';
import 'package:dio/dio.dart' as dio;
import 'package:taoju5_c/domain/entity/user/user_entity.dart';

enum ModifyUserProfileField { avatar, nickname, gender, birthday, none }

extension ModifyUserProfileFieldKit on ModifyUserProfileField {
  int get code =>
      {
        ModifyUserProfileField.avatar: 1,
        ModifyUserProfileField.nickname: 2,
        ModifyUserProfileField.gender: 3,
        ModifyUserProfileField.birthday: 4
      }[this] ??
      0;
}

class ModifyUserProfileParamsEntity extends BaseParamsEntity {
  late ModifyUserProfileField? field;
  String? avatar;
  String? nickname;
  late Gender gender;
  String? birthday;
  dio.MultipartFile? filePath;

  ModifyUserProfileParamsEntity.fromUserEntity(UserEntity user) {
    avatar = user.avatar;
    nickname = user.name;
    gender = user.gender;
    birthday = user.birthday;
    field = ModifyUserProfileField.none;
    initialParams = jsonEncode(params);
  }

  @override
  Map get params => {
        "type": field!.code,
        "user_headimg": avatar,
        "user_name": nickname,
        "sex": gender.code,
        "user_bir": birthday
      };

  @override
  bool validate() => true;
}
