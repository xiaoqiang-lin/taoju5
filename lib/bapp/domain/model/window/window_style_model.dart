/*
 * @Description: 打开方式
 * @Author: iamsmiling
 * @Date: 2021-01-18 17:32:41
 * @LastEditTime: 2021-02-01 15:37:44
 */
import 'package:taoju5/utils/json_kit.dart';

class WindowStyleModel {
  List<WindowStyleOptionModel> styleList;

  WindowStyleModel.fromJson(Map json) {
    styleList = JsonKit.asList(json["-2"])
        .map((e) => WindowStyleOptionModel.fromJson(e))
        .toList()
        .cast<WindowStyleOptionModel>();
  }
}

class WindowStyleOptionModel {
  String name;
  int id;
  List<WindowInstallModeOptionModel> installModeOptionList;

  List<WindowOpenModeOptionModel> openModeOptionList;

  WindowStyleOptionModel.fromJson(Map json) {
    name = json["name"];
    id = json["id"];
    installModeOptionList = JsonKit.asList(json["install_modes"])
        .map((e) => WindowInstallModeOptionModel.fromJson(e))
        .toList()
        .cast<WindowInstallModeOptionModel>();
    openModeOptionList = JsonKit.asList(json["open_modes"])
        .map((e) => WindowOpenModeOptionModel.fromJson(e))
        .toList()
        .cast<WindowOpenModeOptionModel>();
  }

  WindowStyleOptionModel();

  WindowStyleOptionModel copy() {
    WindowStyleOptionModel e = WindowStyleOptionModel();
    e.name = name;
    e.id = id;
    e.installModeOptionList = installModeOptionList
        .map((e) => e.copy())
        .toList()
        .cast<WindowInstallModeOptionModel>();

    e.openModeOptionList = openModeOptionList
        .map((e) => e.copy())
        .toList()
        .cast<WindowOpenModeOptionModel>();
    return e;
  }
}

class WindowInstallModeOptionModel {
  String name;
  bool isChecked;
  String img;
  bool isConfirmed = false;
  WindowInstallModeOptionModel.fromJson(Map json) {
    name = json["name"];
    isChecked = json["is_checked"];
    img = json["img"];
  }
  WindowInstallModeOptionModel();

  WindowInstallModeOptionModel copy() {
    WindowInstallModeOptionModel e = WindowInstallModeOptionModel();
    e.name = name;
    e.isChecked = isChecked;
    e.img = img;
    return e;
  }
}

class WindowOpenModeOptionModel {
  String name;
  bool isChecked;
  int id;
  bool isConfirmed = false;
  List<WindowSubopenModeModel> suboptionList;

  WindowOpenModeOptionModel();
  WindowOpenModeOptionModel.fromJson(Map json) {
    name = json["name"];
    id = json["index"];
    isChecked = json["is_checked"];
    suboptionList = JsonKit.asList(json["sub_options"])
        .map((e) => WindowSubopenModeModel.fromJson(e))
        .toList()
        .cast<WindowSubopenModeModel>();
  }

  WindowOpenModeOptionModel copy() {
    WindowOpenModeOptionModel e = WindowOpenModeOptionModel();
    e.name = name;
    e.isChecked = isChecked;
    e.id = id;
    e.suboptionList = suboptionList
        .map((e) => e.copy())
        .toList()
        .cast<WindowSubopenModeModel>();
    return e;
  }
}

class WindowSubopenModeModel {
  String title;
  List<WindowSubopenModeOptionModel> optionList;
  WindowSubopenModeModel();

  WindowSubopenModeModel.fromJson(Map json) {
    title = json["title"];
    optionList = JsonKit.asList(json["options"])
        .map((e) => WindowSubopenModeOptionModel.fromJson(e))
        .toList()
        .cast<WindowSubopenModeOptionModel>();
  }

  WindowSubopenModeModel copy() {
    WindowSubopenModeModel e = WindowSubopenModeModel();
    e.title = title;
    e.optionList = optionList
        .map((e) => e.copy())
        .toList()
        .cast<WindowSubopenModeOptionModel>();
    return e;
  }
}

class WindowSubopenModeOptionModel {
  String name;
  bool isChecked;
  bool isConfirmed = false;
  WindowSubopenModeOptionModel();
  WindowSubopenModeOptionModel.fromJson(Map json) {
    name = json["name"];
    isChecked = json["is_checked"];
  }

  WindowSubopenModeOptionModel copy() {
    WindowSubopenModeOptionModel e = WindowSubopenModeOptionModel();
    e.name = name;
    e.isChecked = isChecked;
    return e;
  }
}
