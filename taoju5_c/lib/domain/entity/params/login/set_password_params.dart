/*
 * @Description: 设置密码参数
 * @Author: iamsmiling
 * @Date: 2021-06-07 15:03:55
 * @LastEditTime: 2021-06-07 15:08:28
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';

import '../base_params_entity.dart';

class SetPassowrdParamsEntity extends BaseParamsEntity {
  late String password1;

  late String password2;

  SetPassowrdParamsEntity({this.password1 = "", this.password2 = ""});
  @override
  Map get params => {"password": password1, "r_password": password2};

  @override
  bool validate() =>
      !CommonKit.isNullOrEmpty(password1) &&
      !CommonKit.isNullOrEmpty(password2);
}
