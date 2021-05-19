/*
 * @Description:空间
 * @Author: iamsmiling
 * @Date: 2021-05-08 15:27:09
 * @LastEditTime: 2021-05-13 14:58:57
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';

class WindowRoomEntity {
  late bool isRequired;
  late String message;
  late String label;
  late List<WindowRoomOptionEntity> options;

  ShakeAnimationController shakeController = ShakeAnimationController();
  WindowRoomEntity.fromJson(Map json) {
    label = json["label"];
    isRequired = JsonKit.asBool(json["is_required"]);
    message =
        JsonKit.isNullOrBlank(json["message"]) ? "请选择空间" : json["message"];
    options = JsonKit.asList(json["values"])
        .map((e) => WindowRoomOptionEntity.fromJson(e))
        .toList();
  }

  String get value {
    if (selectedOption == null) return "";
    return selectedOption!.name;
  }

  WindowRoomOptionEntity? get selectedOption {
    if (options.isEmpty) return null;
    for (WindowRoomOptionEntity o in options) {
      if (o.selected) return o;
    }
    return null;
  }

  onError() {
    shakeController.start(shakeCount: 1);
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
