/*
 * @Description: 窗帘属性
 * @Author: iamsmiling
 * @Date: 2021-05-08 15:22:03
 * @LastEditTime: 2021-08-06 10:30:47
 */

// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_child_open_mode_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_facade_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_ground_clearance_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_install_mode_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_open_mode_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_room_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_size_entity.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';

class CurtainAttributeEntity {
  bool finished = false;
  bool initialized = false;
  late CurtainMeasureDataAttributeEntity measureData;

  late CurtainMatchingSetAttributeEntity matchingSet;
  CurtainAttributeEntity();

  String get brief => measureData.brief + "...";

  List<CurtainAttributeKeyValuePairEntity> get list => matchingSet.attributes
      .map((e) => CurtainAttributeKeyValuePairEntity(
          key: e.label, value: e.selectedOption?.name ?? ""))
      .toList();

  ///json1 数据来自 assets/data/measure_data.json json2数据来自/app/goods/wcAttr接口
  CurtainAttributeEntity.fromJson(Map json1, Map json2) {
    initialized = true;

    ///空间
    if (!JsonKit.isNullOrBlank(json2["room_list"])) {
      json1["measure_data"]["room"]?..addAll((json2["room_list"]));
    }

    ///工艺
    if (!JsonKit.isNullOrBlank(json2["craft_list"])) {
      json1["matching_set"]["craft"]
        ?..addAll((json2["craft_list"] ?? {}) as Map<String, dynamic>);
    }

    ///型材
    if (!JsonKit.isNullOrBlank(json2["parts_list"])) {
      json1["matching_set"]["sectionalbar"]?..addAll((json2["parts_list"]));
    }

    if (!JsonKit.isNullOrBlank(json2["gauze_list"])) {
      json1["matching_set"]["gauze"]?..addAll((json2["gauze_list"]));
    }

    if (!JsonKit.isNullOrBlank(json2["lining_list"])) {
      json1["matching_set"]["riboux"]?..addAll((json2["lining_list"]));
    }

    if (!JsonKit.isNullOrBlank(json2["curtain_list"])) {
      json1["matching_set"]["valance"]?..addAll((json2["curtain_list"]));
    }

    // ///幔头
    // json1["matching_set"]["valance"]
    //   ?..addAll((json2["curtain_list"] ?? {}) as Map<String, dynamic>);

    ///配饰
    // json1["matching_set"]["accessory"]?..addAll(json2["accessory_list"]);

    measureData =
        CurtainMeasureDataAttributeEntity.fromJson(json1["measure_data"]);

    matchingSet =
        CurtainMatchingSetAttributeEntity.fromJson(json1["matching_set"]);
  }

  List<CurtainAttributeKeyValuePairEntity> adapt() =>
      matchingSet.attributes.map((e) => e.adapt()).toList();
}

class CurtainMeasureDataAttributeEntity {
  String label = "";

  late WindowFacadeEntity facade;

  late WindowOpenModeEntity openMode;

  late WindowInstalllModeEntity installMode;

  late WindowRoomEntity room;

  List<WindowChildOpenModeEntity> _childOpenModes = [];

  late WindowSizeEntity size;

  late WindowGroundClearanceEntity groundClearance;

  String? wcAttrId;
  String? installType;
  String? openType;

  String? sectionalBar;
  String? note;
  List<String>? images;
  String? sectionalBarType;
  String? phone;
  String? sectionalBarCode;

  String get openModeDescription {
    String s = openMode.selectedOpenOption?.name ?? "";
    for (WindowChildOpenModeEntity item in _childOpenModes) {
      for (WindowOpenModeEntity o in item.options) {
        s += " ${o.label.substring(0, 2)}${o.selectedOpenOption?.name}  ";
      }
    }
    return s;
  }

  List<WindowOpenModeOptionEntity> get modifyableOpenModeOption {
    return openMode.options
        .where((e) => e.windowOptionId == windowOptionId && e.id != 3)
        .toList();
  }

  String get brief =>
      "${room.selectedOption?.name},${facade.value},${openMode.selectedOpenOption?.name}";
  CurtainMeasureDataAttributeEntity();
  CurtainMeasureDataAttributeEntity.fromJson(Map json) {
    label = json["label"];
    facade = WindowFacadeEntity.fromJson(json["window"]);
    openMode = WindowOpenModeEntity.fromJson(json["open_mode"]);
    _childOpenModes = JsonKit.asList(json["subopen_mode_options"])
        .map((e) => WindowChildOpenModeEntity.fromJson(e))
        .toList();
    installMode = WindowInstalllModeEntity.fromJson(json["install_mode"]);
    room = WindowRoomEntity.fromJson(json["room"]);

    size = WindowSizeEntity.fromJson(json["size"]);

    groundClearance =
        WindowGroundClearanceEntity.fromJson(json["ground_clearance"]);
  }
  CurtainMeasureDataAttributeEntity.fromCartProductJson(Map json) {
    sectionalBar = json["parts_type"] ?? "";
    size = WindowSizeEntity();
    initSize("${json["width"]}", "${json["height"]}");
    groundClearance = WindowGroundClearanceEntity();
    initGroundClearance("${json["vertical_ground_height"]}");
    room = WindowRoomEntity();
    room.initByName(json["install_room"]);
    installMode = WindowInstalllModeEntity();
    installMode.initWithName(json["install_type"]);
    openType = json["open_type"];
    wcAttrId = "${json["wc_attr_id"]}";
    installType = json["install_type"];
    openMode = WindowOpenModeEntity();
    openMode.initWithIdAndName(
        JsonKit.asInt(JsonKit.asInt(json["wc_attr_id"])), json["open_type"]);
    facade = WindowFacadeEntity();
    facade.init(
        JsonKit.asInt(JsonKit.asInt(json["wc_attr_id"])), json["window_type"]);
  }

  void initFromJson(Map json) {
    initSize("${json["width"]}", "${json["height"]}");
    initGroundClearance("${json["vertical_ground_height"]}");
    room.initByName(json["install_room"]);
    installMode.initWithName(json["install_type"]);
    openMode.initWithIdAndName(
        JsonKit.asInt(JsonKit.asInt(json["wc_attr_id"])), json["open_type"]);
    facade.init(
        JsonKit.asInt(JsonKit.asInt(json["wc_attr_id"])), json["window_type"]);
  }

  CurtainMeasureDataAttributeEntity.fromSceneProductJson(Map json) {
    sectionalBar = json["parts_type"];
    size = WindowSizeEntity();
    initSize("${json["width"]}", "${json["height"]}");
    groundClearance = WindowGroundClearanceEntity();
    initGroundClearance("${json["vertical_ground_height"]}");
    room = WindowRoomEntity();
    room.initByName(json["install_room"]);
    installMode = WindowInstalllModeEntity();
    installMode.initWithName(json["install_type"]);
    openType = json["open_type"];
    wcAttrId = "${json["wc_attr_id"]}";
    installType = json["install_type"];
    openMode = WindowOpenModeEntity();
    openMode.initWithIdAndName(
        JsonKit.asInt(JsonKit.asInt(json["wc_attr_id"])), json["open_type"]);
    facade = WindowFacadeEntity();
    facade.init(
        JsonKit.asInt(JsonKit.asInt(json["wc_attr_id"])), json["window_type"]);
  }

  CurtainMeasureDataAttributeEntity.fromJson2(Map json, Map json2) {
    json = json["measure_data"];
    label = json["label"] ?? "";
    facade = WindowFacadeEntity.fromJson(json["window"]);
    openMode = WindowOpenModeEntity.fromJson(json["open_mode"]);
    _childOpenModes = JsonKit.asList(json["subopen_mode_options"])
        .map((e) => WindowChildOpenModeEntity.fromJson(e))
        .toList();
    installMode = WindowInstalllModeEntity.fromJson(json["install_mode"]);
    room = WindowRoomEntity.fromJson(json["room"]);

    size = WindowSizeEntity.fromJson(json["size"]);

    groundClearance =
        WindowGroundClearanceEntity.fromJson(json["ground_clearance"]);
    sectionalBarCode = json2["parts_type"];
    sectionalBar = json2["parts_type_name"];
    sectionalBarType = json2["parts_name"];
    phone = json2["phone"];
    note = json2["remark"];

    room.initByName(json2["install_room"]);
    facade.init(JsonKit.asInt(json2["wc_attr_id"]), json2["window_type"]);

    installMode.initWithName(json2["install_type"]);
    openMode.initWithIdAndName(json2["wc_attr_id"], json2["open_type"]);

    Map tmp = JsonKit.asMap(json2["data"]);

    initSize("${json2["width"]}", "${json2["height"]}");

    initGroundClearance("${json2["vertical_ground_height"]}");

    initABC(
      aOpenMode: tmp["A"],
      aWidth: tmp["width_a"],
      aHeight: tmp["height_a"],
      bOpenMode: tmp["B"],
      bWidth: tmp["width_b"],
      bHeight: tmp["height_b"],
      cOpenMode: tmp["C"],
      cWidth: tmp["width_c"],
      cHeight: tmp["height_c"],
    );

    // size
  }

  ///初始化宽高
  void initSize(String width, String height) {
    size.width = JsonKit.asDouble(width);
    size.height = JsonKit.asDouble(height);
  }

  ///初始化离地距离
  void initGroundClearance(String deltaY) {
    groundClearance.value = JsonKit.asDouble(deltaY);
  }

  /// 初始化 a b c面的打开方式
  void initABC({
    String aOpenMode = "",
    String aWidth = "",
    String aHeight = "",
    String bOpenMode = "",
    String bWidth = "",
    String bHeight = "",
    String cOpenMode = "",
    String cWidth = "",
    String cHeight = "",
  }) {
    _initChildOpenMode("A面", aOpenMode, aWidth, aHeight);
    _initChildOpenMode("B面", bOpenMode, bWidth, bHeight);
    _initChildOpenMode("C面", cOpenMode, cWidth, cHeight);
  }

  ///初始化子打开方式
  void _initChildOpenMode(
      String s, String? openMode, String width, String height) {
    childOpenModes.forEach((e) {
      e.options.forEach((o) {
        if (o.label.contains(s)) {
          o.options.forEach((i) {
            i.selected = openMode == null ? false : i.name.contains(openMode);
          });

          if (o.size != null) {
            o.size!.width = JsonKit.asDouble(width);
            o.size!.height = JsonKit.asDouble(height);
          }
        }
      });
    });
  }

  /// 窗型id -1表示未找到匹配的窗型
  int get windowOptionId {
    for (int i = 0; i < facade.options.length; i++) {
      WindowFacadeOptionEntity o = facade.options[i];
      if (o.name == windowOptionName) {
        return o.id;
      }
    }
    return -1;
  }

  bool get sizeIsNotEmpty =>
      !CommonKit.isNullOrZero(size.width) &&
      !CommonKit.isNullOrZero(size.height);

  ///窗型名称
  String get windowOptionName => facade.value;

  ///返回窗型图片
  String get mainImage {
    for (int i = 0; i < installMode.options.length; i++) {
      WindowInstallModeOptionEntity o = installMode.options[i];
      if (o.windowOptionId == windowOptionId) {
        print(o.image);
        return o.image;
      }
    }
    return "";
  }

  ///安装方式可选项
  List<WindowInstallModeOptionEntity> get installOptions {
    List<WindowInstallModeOptionEntity> list = [];
    for (int i = 0; i < installMode.options.length; i++) {
      WindowInstallModeOptionEntity o = installMode.options[i];
      if (o.windowOptionId == windowOptionId) {
        list.add(o);
      }
    }
    return list;
  }

  WindowInstallModeOptionEntity? get selectedInstallOption {
    for (int i = 0; i < installOptions.length; i++) {
      WindowInstallModeOptionEntity o = installOptions[i];
      if (o.selected) return o;
    }
    return null;
  }

  WindowOpenModeOptionEntity? get selectedOpenOption {
    for (int i = 0; i < openOptions.length; i++) {
      WindowOpenModeOptionEntity o = openOptions[i];
      if (o.selected) return o;
    }
    return null;
  }

  ///打开方式可选项
  List<WindowOpenModeOptionEntity> get openOptions {
    List<WindowOpenModeOptionEntity> list = [];
    for (int i = 0; i < openMode.options.length; i++) {
      WindowOpenModeOptionEntity item = openMode.options[i];
      if (item.windowOptionId == windowOptionId) {
        list.add(item);
      }
    }
    return list;
  }

  int get openModeId {
    if (openOptions.isEmpty) return -1;
    if (openOptions.every((e) => !e.selected)) return -1;
    return openOptions.firstWhere((e) => e.selected).id;
  }

  ///子打开方式可选项
  List<WindowChildOpenModeEntity> get childOpenModes {
    List<WindowChildOpenModeEntity> list = [];
    for (int i = 0; i < _childOpenModes.length; i++) {
      WindowChildOpenModeEntity item = _childOpenModes[i];
      if (item.openModeId == openModeId &&
          item.windowIdList.contains(windowOptionId)) {
        list.add(item);
      }
    }
    return list;
  }

  // ///打开方式可选项
  // WindowChildOpenModeEntity get selectedChildOpenMode {
  //   List<WindowChildOpenModeEntity> list = [];
  //   return ""
  //   // for (int i = 0; i < childOpenModes.length; i++) {
  //   //   WindowChildOpenModeEntity item = childOpenModes[i];
  //   //   if(item.)
  //   // }
  //   // return list;
  // }

  bool get hasBox => windowOptionName.contains("有盒");

  Map get params {
    Map map = {
      "wc_attr_id": wcAttrId ?? windowOptionId,
      "install_room": room.value,
      "vertical_ground_height": groundClearance.value,
      "install_type": installType ?? selectedInstallOption?.name,
      "open_type": openType ?? selectedOpenOption?.name,
      "window_type": windowOptionName,
      "width": size.width,
      "height": size.height,
      "parts_type": sectionalBarCode ?? sectionalBar,
      "several_wall": facade.count
    };
    Map data = {};

    for (WindowChildOpenModeEntity child in childOpenModes) {
      data.addAll(child.params);
      map = {...map, ...child.params};
    }
    map.addAll({"data": data});
    return map;
  }
}

class CurtainMatchingSetAttributeEntity {
  late String label;

  /// 工艺
  late CurtainAddtionalProductEntity craft;

  ///型材
  late CurtainAddtionalProductEntity sectionalbar;

  ///窗纱
  late CurtainAddtionalProductEntity gauze;

  ///里布
  late CurtainAddtionalProductEntity riboux;

  ///窗慢
  late CurtainAddtionalProductEntity valance;

  ///配饰
  // late CurtainAddtionalProductEntity accessory;

  ///是否有轨道
  bool get hasTrack {
    if (craft.selectedOption == null) return false;
    return craft.selectedOption!.name.contains("轨道");
  }

  //是否有窗纱
  bool get hasGauze {
    if (gauze.selectedOption == null) return false;
    return !gauze.selectedOption!.name.contains("不要");
  }

  double get accessoryPrice {
    // if (accessory.options.isEmpty) return 0;
    // double price = 0;
    // for (CurtainAddtionalProductOptionEntity o in accessory.options) {
    //   price += o.selected ? o.price : 0;
    // }
    // return price;
    return 0;
  }

  void initFromId(int id) {}

  List<CurtainAddtionalProductEntity> get attributes =>
      [craft, sectionalbar, gauze, riboux, valance];

  CurtainMatchingSetAttributeEntity.fromJson(Map json) {
    label = json["label"];

    craft =
        CurtainAddtionalProductEntity.fromJson(json["craft"], hint: "请选择工艺");

    sectionalbar = CurtainAddtionalProductEntity.fromJson(json["sectionalbar"],
        hint: "请选择型材");

    gauze = CurtainAddtionalProductEntity.fromJson(json["gauze"]);

    riboux = CurtainAddtionalProductEntity.fromJson(json["riboux"]);

    valance = CurtainAddtionalProductEntity.fromJson(json["valance"]);

    // accessory = CurtainAddtionalProductEntity.fromJson(json["accessory"]);
    // craft =
    //     CurtainAddtionalProductEntity.fromList(json["craft_list"], label: "工艺");
    // sectionalbar =
    //     CurtainAddtionalProductEntity.fromList(json["parts_list"], label: "型材");
    // gauze =
    //     CurtainAddtionalProductEntity.fromList(json["gauze_list"], label: "窗纱");
    // riboux = CurtainAddtionalProductEntity.fromList(json["curtain_list"],
    //     label: "里布");
    // valance = CurtainAddtionalProductEntity.fromList(json["lining_list"],
    //     label: "窗幔");

    // accessory = CurtainAddtionalProductEntity.fromList(json["accessory_list"],
    //     label: "配饰");
  }

  Map get params => {
        "process_method": [craft.selectedOption?.id ?? 0],
        "wc_attr": jsonEncode({
          "process_method": [craft.selectedOption?.id ?? 0],
          "craft_id": [craft.selectedOption?.id ?? 0],
          "gauze_id": [gauze.selectedOption?.id ?? 0],
          "parts_id": [sectionalbar.selectedOption?.id ?? 0],
          "curtain_id": [valance.selectedOption?.id ?? 0],
          "lining_id": [riboux.selectedOption?.id ?? 0],
        })
      };
}

///窗帘附加商品
class CurtainAddtionalProductEntity {
  late List<CurtainAddtionalProductOptionEntity> initialOptions;
  late String label;
  late String message;
  late String hint;
  late bool isRequired;
  late bool isMultiple;
  bool hasError = false;
  ShakeAnimationController shakeController = ShakeAnimationController();

  CurtainAddtionalProductEntity.fromJson(Map json, {this.hint = ""}) {
    label = json["label"];
    initialOptions = JsonKit.asList(json["values"])
        .map((e) => CurtainAddtionalProductOptionEntity.fromJson(e))
        .toList();
    message = json["message"] ?? "";
    isRequired = JsonKit.asBool(json["is_required"]);
    isMultiple = JsonKit.asBool(json["is_multiple"]);
  }

  CurtainAttributeKeyValuePairEntity adapt() {
    return CurtainAttributeKeyValuePairEntity(
        key: label, value: selectedOption?.name ?? "");
  }

  CurtainAddtionalProductOptionEntity? get selectedOption {
    if (initialOptions.isEmpty) return null;
    if (initialOptions.every((e) => !e.selected)) return null;
    return initialOptions.firstWhere((e) => e.selected);
  }

  List<CurtainAddtionalProductOptionEntity> get options {
    if (initialOptions.isEmpty) return [];
    if (initialOptions.length == 1) {
      initialOptions.first.selected = true;
    }
    return initialOptions.where((e) => e.visibile).toList();
  }

  onError() {
    if (selectedOption != null) {
      hasError = false;
      return;
    }
    hasError = true;
    shakeController.start(shakeCount: 1);
  }
}

class CurtainAddtionalProductOptionEntity {
  late int id;

  late int type;

  late String name;

  late String value;

  late PictureEntity picture;

  late double price;

  late String image;

  bool selected = false;

  bool visibile = true;

  ///是否有轨道
  bool get hasTrack => name.contains("轨道");

  CurtainAddtionalProductOptionEntity.fromJson(Map json) {
    id = json["id"];
    type = json["type"];
    name = json["name"] ?? "";
    value = json["value"] ?? "";
    image = JsonKit.asWebUrl(json["picture"]);
    price = JsonKit.asDouble(json["price"]);
    picture = PictureEntity.fromJson(json["picture_main"]);
    selected = JsonKit.asBool(json["is_selected"]);
  }
}

class CurtainAttributeKeyValuePairEntity {
  late String key;
  late String value;

  CurtainAttributeKeyValuePairEntity.fromJson(Map json) {
    key = json["name"];
    value = json["value"];
  }

  CurtainAttributeKeyValuePairEntity({required this.key, required this.value});
}
