/*
 * @Description: 图片
 * @Author: iamsmiling
 * @Date: 2021-04-23 14:42:29
 * @LastEditTime: 2021-05-11 17:30:02
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class PictureEntity {
  late int id;
  late String cover;
  late String size;
  late String bigImage;

  PictureEntity.fromJson(Map json) {
    id = json["pic_id"];
    cover = JsonKit.asWebUrl(json["pic_cover"] ?? json["pic_cover_small"]);
    size = json["pic_spec"];
    bigImage = JsonKit.asWebUrl(json["pic_cover_long"]);
  }

  double get _width {
    if (size.contains(",")) {
      String val = size.split(",").first;
      return CommonKit.asDouble(val);
    }
    if (size.contains("*")) {
      String val = size.split("*").first;
      return CommonKit.asDouble(val);
    }
    return 0;
  }

  double get _height {
    if (size.contains(",")) {
      String val = size.split(",").last;
      return CommonKit.asDouble(val);
    }
    if (size.contains("*")) {
      String val = size.split("*").last;
      return CommonKit.asDouble(val);
    }
    return 0;
  }

  double get aspectRatio => _height == 0 ? 1 : _width / _height;
}
