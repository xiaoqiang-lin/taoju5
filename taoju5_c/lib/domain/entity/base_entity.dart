/*
 * @Description: 网络请求返回数据
 * @Author: iamsmiling
 * @Date: 2021-04-06 13:06:37
 * @LastEditTime: 2021-04-15 16:17:26
 */
class BaseEntity {
  int code;
  dynamic data;
  String message;

  BaseEntity.fromJson(Map json) {
    code = json["code"];
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
