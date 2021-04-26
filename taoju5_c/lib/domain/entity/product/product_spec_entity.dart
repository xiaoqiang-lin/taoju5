/*
 * @Description: 商品规格  对成品而言
 * @Author: iamsmiling
 * @Date: 2021-04-25 14:50:54
 * @LastEditTime: 2021-04-26 16:58:20
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class ProductSpecEntity {
  late String name;
  late int id;

  late List<ProductSpecOptionEntity> options;

  ProductSpecEntity.fromJson(Map json) {
    name = json["spec_name"];
    id = JsonKit.asInt(json["spec_id"]);
    options = JsonKit.asList(json["value"])
        .map((e) => ProductSpecOptionEntity.fromJson(e))
        .toList();
  }

  ProductSpecOptionEntity? get selected {
    if (options.isEmpty) return null;
    for (int i = 0; i < options.length; i++) {
      if (options[i].selected) return options[i];
    }
    return null;
  }
}

enum OptionDisplayMode { text, image }

class ProductSpecOptionEntity {
  late int id;
  late String name;
  late bool selected;
  late bool disabled;
  late int type;
  late String image;

  ///是否缺货
  late bool isOutofStock;

  OptionDisplayMode get mode =>
      {
        1: OptionDisplayMode.text,
        2: OptionDisplayMode.image,
        3: OptionDisplayMode.text,
      }[type] ??
      OptionDisplayMode.text;

  ProductSpecOptionEntity.fromJson(Map json) {
    id = JsonKit.asInt(json["spec_value_id"]);
    name = json["spec_value_name"];
    selected = json["selected"];
    disabled = json["disabled"];
    type = JsonKit.asInt(json["spec_show_type"]);
    image = JsonKit.asWebUrl(json["spec_value_data"]);
    isOutofStock = json["disabled"];
  }
}
