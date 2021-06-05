/*
 * @Description: 窗帘打开方式
 * @Author: iamsmiling
 * @Date: 2021-05-08 11:24:01
 * @LastEditTime: 2021-06-03 17:22:04
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

import 'window_size_entity.dart';

class WindowOpenModeEntity {
  late String label;
  late String key;
  WindowSizeEntity? size;

  late List<WindowOpenModeOptionEntity> options;

  WindowOpenModeEntity.fromJson(Map json) {
    label = json["label"];
    key = json["key"];
    size = WindowSizeEntity.fromJson(json["size"]);
    options = JsonKit.asList(json["options"])
        .map((e) => WindowOpenModeOptionEntity.fromJson(e))
        .toList();
  }

  WindowOpenModeOptionEntity? get selectedOpenOption {
    for (int i = 0; i < options.length; i++) {
      WindowOpenModeOptionEntity o = options[i];

      if (o.selected) return o;
    }
    return null;
  }

  String get description {
    String s = selectedOpenOption?.name ?? "";

    return s;
  }
}

class WindowOpenModeOptionEntity {
  int? windowOptionId;
  late int id;
  late String name;
  late bool selected;

  WindowOpenModeOptionEntity.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    selected = json["selected"];
    windowOptionId = json["window_option_id"];
  }
}
