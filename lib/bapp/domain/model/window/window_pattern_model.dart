/*
 * @Description: 窗型
 * @Author: iamsmiling
 * @Date: 2021-01-18 16:27:45
 * @LastEditTime: 2021-01-19 14:37:08
 */

import 'package:get/utils.dart';
import 'package:taoju5/utils/json_kit.dart';

class WindowPatternModel {
  String title;
  List<WindowPatternOptionModel> optionList;

  WindowPatternModel.fromJson(Map json) {
    title = json["title"];
    optionList = JsonKit.asList(json["options"])
        .map((e) => WindowPatternOptionModel.fromJson(e))
        .toList()
        .cast<WindowPatternOptionModel>();
  }
  WindowPatternModel();
  WindowPatternModel copy() {
    WindowPatternModel e = WindowPatternModel();
    e.title = title;
    e.optionList = optionList
        .map((e) => e.copy())
        .toList()
        .cast<WindowPatternOptionModel>();
    return e;
  }
}

extension WindowPatternModelKit on WindowPatternModel {
  String get confirmedOptionName => confirmedOption?.name ?? "";
  WindowPatternOptionModel get currentOption {
    if (GetUtils.isNullOrBlank(optionList)) return null;
    for (int i = 0; i < optionList.length; i++) {
      WindowPatternOptionModel o = optionList[i];
      if (o.isChecked) return o;
    }
    return null;
  }

  WindowPatternOptionModel get confirmedOption {
    if (GetUtils.isNullOrBlank(optionList)) return null;
    for (int i = 0; i < optionList.length; i++) {
      WindowPatternOptionModel o = optionList[i];
      if (o.isChecked && o.hasConfirm) return o;
    }
    return null;
  }
}

class WindowPatternOptionModel {
  String name;
  String img;
  bool isChecked;
  int id;
  bool hasConfirm;
  WindowPatternOptionModel(this.id, this.name, this.img,
      {this.isChecked = false, this.hasConfirm = false});

  WindowPatternOptionModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json['name'];
    img = json['img'];
    isChecked = json['is_checked'];
    hasConfirm = json['has_confirm'];
  }
  Map<String, dynamic> toJson() =>
      {'name': name, 'img': img, 'is_checked': isChecked};

  WindowPatternOptionModel copy() {
    return WindowPatternOptionModel(id, name, img,
        isChecked: isChecked, hasConfirm: hasConfirm);
  }
}
