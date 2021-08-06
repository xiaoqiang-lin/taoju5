/*
 * @Description: 窗型
 * @Author: iamsmiling
 * @Date: 2021-05-08 11:14:08
 * @LastEditTime: 2021-07-30 11:18:43
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class WindowFacadeEntity {
  late String label;
  List<WindowFacadeOptionEntity> options = [];

  ///将窗帘样式 窗型选择 有盒无盒 视为children
  List<WindowFacadeEntity> children = [];

  WindowFacadeEntity();

  WindowFacadeEntity.fromJson(Map json) {
    label = json["label"];
    options = JsonKit.asList(json["options"])
        .map((e) => WindowFacadeOptionEntity.fromJson(e))
        .toList();
    children = JsonKit.asList(json["children"])
        .map((e) => WindowFacadeEntity.fromJson(e))
        .toList();
  }

  ///窗型名称
  String get value {
    List<String> val = [];
    for (int i = 0; i < children.length; i++) {
      WindowFacadeEntity child = children[i];
      for (int i = 0; i < child.options.length; i++) {
        WindowFacadeOptionEntity option = child.options[i];
        if (option.selected) {
          val.add(option.name);
        }
      }
    }
    return val.join("/");
  }

  int get count {
    if (value.contains("单")) return 1;
    if (value.contains("L")) return 2;
    if (value.contains("U")) return 3;
    return 1;
  }

  /// 窗型id -1表示未找到匹配的窗型
  int get windowOptionId {
    for (int i = 0; i < options.length; i++) {
      WindowFacadeOptionEntity o = options[i];

      if (o.name == value) {
        return o.id;
      }
    }
    return -1;
  }

  void init(int id, String name) {
    List<String> list = name.split("/");
    children.forEach((child) {
      child.options.forEach((e) {
        e.selected = list.contains(e.name);
      });
    });
    options.forEach((e) {
      e.selected = e.id == id;
    });
  }
}

class WindowFacadeOptionEntity {
  late int id;
  late String name;
  late String image;
  late bool selected;
  WindowFacadeOptionEntity.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    image = json["img"];
    selected = json["selected"];
  }
}
