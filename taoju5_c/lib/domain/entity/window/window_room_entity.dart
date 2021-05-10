/*
 * @Description:空间
 * @Author: iamsmiling
 * @Date: 2021-05-08 15:27:09
 * @LastEditTime: 2021-05-10 11:29:00
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class WindowRoomEntity {
  late bool isRequired;
  late String message;
  late List<WindowRoomOptionEntity> options;

  WindowRoomEntity.fromJson(Map json) {
    isRequired = JsonKit.asBool(json["is_required"]);
    message = json["message"];
    options = JsonKit.asList(json["values"])
        .map((e) => WindowRoomOptionEntity.fromJson(e))
        .toList();
  }
}

class WindowRoomOptionEntity {
  late int id;
  late int type;
  late String name;
  late bool selected;

  WindowRoomOptionEntity.fromJson(Map json) {
    id = json["id"];
    type = json["type"];
    name = json["name"];
    selected = false;
  }
}
