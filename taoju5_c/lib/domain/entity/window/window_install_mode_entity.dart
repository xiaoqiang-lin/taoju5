/*
 * @Description: 窗帘安装方式
 * @Author: iamsmiling
 * @Date: 2021-05-08 12:12:01
 * @LastEditTime: 2021-05-08 12:19:31
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class WindowInstalllModeEntity {
  late String label;
  late List<WindowInstallModeOptionEntity> options;

  WindowInstalllModeEntity.fromJson(Map json) {
    label = json["label"];
    options = JsonKit.asList(json["options"])
        .map((e) => WindowInstallModeOptionEntity.fromJson(e))
        .toList();
  }
}

class WindowInstallModeOptionEntity {
  late int windowOptionId;
  late String name;
  late String image;
  late bool selected;

  WindowInstallModeOptionEntity.fromJson(Map json) {
    windowOptionId = json["window_option_id"];
    name = json["name"];
    image = json["image"];
    selected = json["selected"];
  }
}
