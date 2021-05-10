/*
 * @Description:窗帘属性
 * @Author: iamsmiling
 * @Date: 2021-05-06 10:06:30
 * @LastEditTime: 2021-05-08 08:59:38
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';

///定义一个接口 所有的属性类都必须实现这个接口
abstract class BaseCurtainProductAttributeEntity {
  late String title;

  late String errorTip;
}

class CurtainProductAttributeOptionEntity {
  late int id;
  late int type;
  late String name;
  PictureEntity? picture;
  double? price;
  CurtainProductAttributeOptionEntity.fromJson(Map json) {
    id = json["id"];
    type = json["type"];
    name = json["name"];
    picture = PictureEntity.fromJson(json["picture_main"]);
    price = JsonKit.asDouble(json["price"]);
  }
}
