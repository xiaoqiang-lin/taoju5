/*
 * @Description: 窗帘打开方式
 * @Author: iamsmiling
 * @Date: 2021-05-08 11:24:01
 * @LastEditTime: 2021-05-10 11:09:38
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class WindowOpenModeEntity {
  late int windowOptionId;
  late String label;
  late WindowSizeEntity size;
  late WindowGroundClearanceEntity groundClearance;

  WindowOpenModeEntity.fromJson(Map json) {
    windowOptionId = json["window_option_id"];
    label = json["label"];
    size = WindowSizeEntity.fromJson(json["size"]);
    groundClearance =
        WindowGroundClearanceEntity.fromJson(json["ground_clearance"]);
  }
}

class WindowOpenModeOption {
  late String name;
  late bool selected;
  late List<WindowOpenModeEntity> children;

  WindowOpenModeOption.fromJson(Map json) {
    name = json["name"];
    selected = json["selected"];
    children = JsonKit.asList(json["children"])
        .map((e) => WindowOpenModeEntity.fromJson(e))
        .toList();
  }
}

class WindowSizeEntity {
  late String label;
  double? width;
  double? height;
  WindowSizeEntity.fromJson(Map json) {
    label = json["label"];
    width = json["width"];
    height = json["height"];
  }
}

class WindowGroundClearanceEntity {
  late String label;
  double? value;

  WindowGroundClearanceEntity.fromJson(Map json) {
    label = json["label"];
    value = json["value"];
  }
}
