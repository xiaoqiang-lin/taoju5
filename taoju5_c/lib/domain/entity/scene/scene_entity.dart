/*
 * @Description: 场景列表项数据模型
 * @Author: iamsmiling
 * @Date: 2021-05-28 09:31:21
 * @LastEditTime: 2021-05-28 16:55:39
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class SceneEntity {
  late int id;
  late String description;

  late String name;

  late String label;

  late String image;

  late String size;

  double get aspectRatio {
    List<String> arr = size.contains("*") ? size.split("*") : size.split(",");
    double w = double.parse(arr.first);
    double h = double.parse(arr.last);
    return w / h;
  }

  SceneEntity.fromJson(Map json) {
    id = json["scenes_id"];
    description = json["scenes_detail"];
    name = json["scenes_name"];
    image = JsonKit.asWebUrl(json["image"]);
    label = json["browse"];
    size = json["pic_spec"];
  }
}
