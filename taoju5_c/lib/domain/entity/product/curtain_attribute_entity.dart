/*
 * @Description: 窗帘属性
 * @Author: iamsmiling
 * @Date: 2021-05-08 15:22:03
 * @LastEditTime: 2021-05-10 11:05:36
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_facade_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_install_mode_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_open_mode_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_room_entity.dart';

class CurtainAttributeEntity {
  late CurtainMeasureDataAttributeEntity measureData;

  late CurtainMatchingSetAttributeEntity matchingSet;

  ///json1 数据来自 assets/data/measure_data.json json2数据来自/app/goods/wcAttr接口
  CurtainAttributeEntity.fromJson(Map json1, Map json2) {
    ///空间
    json1["measure_data"]["room"]?..addAll(json2["room_list"]);

    ///工艺
    json1["matching_set"]["craft"]?..addAll(json2["craft_list"]);

    ///型材
    json1["matching_set"]["sectionalbar"]?..addAll(json2["parts_list"]);

    ///窗纱
    json1["matching_set"]["gauze"]?..addAll(json2["gauze_list"]);

    ///里布
    json1["matching_set"]["riboux"]?..addAll(json2["curtain_list"]);

    ///幔头
    json1["matching_set"]["valance"]?..addAll(json2["lining_list"]);

    ///配饰
    json1["matching_set"]["accessory"]?..addAll(json2["accessory_list"]);

    measureData =
        CurtainMeasureDataAttributeEntity.fromJson(json1["measure_data"]);

    matchingSet =
        CurtainMatchingSetAttributeEntity.fromJson(json1["matching_set"]);

    print(this);
    print("+++++++++++++++++++++");
  }
}

class CurtainMeasureDataAttributeEntity {
  late String label;

  late WindowFacadeEntity facade;

  late List<WindowOpenModeEntity> openMode;

  late WindowInstalllModeEntity installMode;

  late WindowRoomEntity room;

  CurtainMeasureDataAttributeEntity.fromJson(Map json) {
    label = json["label"];
    facade = WindowFacadeEntity.fromJson(json["window"]);
    openMode = JsonKit.asList(json["open_mode"])
        .map((e) => WindowOpenModeEntity.fromJson(e))
        .toList();
    installMode = WindowInstalllModeEntity.fromJson(json["install_mode"]);
    room = WindowRoomEntity.fromJson(json["room"]);
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
  late CurtainAddtionalProductEntity accessory;

  CurtainMatchingSetAttributeEntity.fromJson(Map json) {
    label = json["label"];

    craft = CurtainAddtionalProductEntity.fromJson(json["craft"]);

    sectionalbar = CurtainAddtionalProductEntity.fromJson(json["sectionalbar"]);

    gauze = CurtainAddtionalProductEntity.fromJson(json["gauze"]);

    riboux = CurtainAddtionalProductEntity.fromJson(json["riboux"]);

    valance = CurtainAddtionalProductEntity.fromJson(json["valance"]);

    accessory = CurtainAddtionalProductEntity.fromJson(json["accessory"]);
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
}

///窗帘附加商品
class CurtainAddtionalProductEntity {
  late List<CurtainAddtionalProductOptionEntity> options;
  late String label;
  CurtainAddtionalProductEntity.fromJson(Map json) {
    label = json["label"];
    options = JsonKit.asList(json["values"])
        .map((e) => CurtainAddtionalProductOptionEntity.fromJson(e))
        .toList();
  }
}

class CurtainAddtionalProductOptionEntity {
  late int id;

  late int type;

  late String name;

  late String value;

  late PictureEntity picture;

  late double price;

  CurtainAddtionalProductOptionEntity.fromJson(Map json) {
    id = json["id"];
    type = json["type"];
    name = json["name"];
    value = json["value"];
    price = JsonKit.asDouble(json["price"]);
  }
}
