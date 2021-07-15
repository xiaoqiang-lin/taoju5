/*
 * @Description: 窗帘打开方式的子选项
 * @Author: iamsmiling
 * @Date: 2021-05-10 18:01:21
 * @LastEditTime: 2021-06-30 09:45:23
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/window/window_ground_clearance_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_open_mode_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_size_entity.dart';

class WindowChildOpenModeEntity {
  late List windowIdList;
  late int openModeId;
  late WindowSizeEntity size;
  late WindowGroundClearanceEntity groundClearance;
  late List<WindowOpenModeEntity> options;

  WindowChildOpenModeEntity.fromJson(Map json) {
    windowIdList = json["window_id"];
    openModeId = json["open_mode_id"];
    size = WindowSizeEntity.fromJson(json["size"]);
    options = JsonKit.asList(json["options"])
        .map((e) => WindowOpenModeEntity.fromJson(e))
        .toList();
  }

  Map get params {
    Map map = {};
    for (WindowOpenModeEntity o in options) {
      map["${o.key}"] = o.selectedOpenOption?.name;
      map["width_${o.key.toLowerCase()}"] = o.size?.width;
      map["height_${o.key.toLowerCase()}"] = o.size?.height;
    }
    return map;
  }
}
