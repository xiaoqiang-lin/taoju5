/*
 * @Description:空间
 * @Author: iamsmiling
 * @Date: 2021-05-08 15:27:09
 * @LastEditTime: 2021-07-22 11:27:13
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';

class WindowRoomEntity {
  late bool isRequired;
  late String message;
  late String label;
  List<WindowRoomOptionEntity> options = [];

  String? _value;

  WindowRoomEntity();

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
    if (_value != null) return _value!;
    if (selectedOption == null) return "";
    return selectedOption!.name;
  }

  setValue(String v) {
    _value = v;
  }

  WindowRoomOptionEntity? get selectedOption {
    if (options.isEmpty) return null;
    for (WindowRoomOptionEntity o in options) {
      if (o.selected) return o;
    }
    return null;
  }

  initByName(String name) {
    _value = name;
    print("------$options");

    options.forEach((e) {
      print(e.name);
      print(name);

      e.selected = e.name.contains(name) || name.contains(e.name);
    });
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
