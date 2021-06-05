/*
 * @Description: 网络请求返回数据
 * @Author: iamsmiling
 * @Date: 2021-04-06 13:06:37
 * @LastEditTime: 2021-06-03 15:51:28
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class BaseEntity {
  int code = 0;
  late dynamic data;
  String message = "";

  BaseEntity.fromJson(Map json) {
    code = JsonKit.asInt(json["code"]);
    data = json["data"];
    message = json["message"];
  }

  BaseEntity(dynamic data) {
    this.data = data;
  }

  @override
  String toString() {
    return "BaseEntity{code:$code,data:$data,message:$message}";
  }

  bool get success => code == 0;

  bool get unAuthed => code == 999;
}
