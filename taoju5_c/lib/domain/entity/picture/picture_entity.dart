/*
 * @Description: 图片
 * @Author: iamsmiling
 * @Date: 2021-04-23 14:42:29
 * @LastEditTime: 2021-07-08 15:13:15
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/rendering.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
// ignore: import_of_legacy_library_into_null_safe
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class PictureEntity {
  late String id;
  late String cover;
  late String size;
  late String bigImage;
  late String thumbnail;

  PictureEntity(
      {required this.id,
      required this.cover,
      required this.bigImage,
      this.size = ""});

  PictureEntity.fromJson(Map json) {
    id = "${json["pic_id"]}";
    cover = JsonKit.asWebUrl(
        json["pic_cover"] ?? json["pic_cover_small"] ?? json["pic_cover_long"]);
    size = json["pic_spec"] ?? "";
    bigImage = JsonKit.asWebUrl(json["pic_cover_long"]);
    thumbnail = JsonKit.asWebUrl(json["pic_cover_small"] ?? json["pic_cover"]);
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

  BoxFit get fit => aspectRatio > 1 ? BoxFit.fitHeight : BoxFit.fitWidth;
}

List<PictureEntity> sliderSampleData = [
  {
    "pic_id": 3417,
    "pic_spec": "6240*4160",
    "pic_cover":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510494137492.JPG",
    "pic_cover_long":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510494137492.JPG",
    "pic_cover_big":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510494137492_BIG.JPG",
    "pic_cover_mid":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510494137492_MID.JPG",
    "pic_cover_small":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510494137492_SMALL.JPG",
    "domain": "http:\/\/www.taoju5.com"
  },
  {
    "pic_id": 3418,
    "pic_spec": "6240*4160",
    "pic_cover":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510494395932.JPG",
    "pic_cover_long":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510494395932.JPG",
    "pic_cover_big":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510494395932_BIG.JPG",
    "pic_cover_mid":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510494395932_MID.JPG",
    "pic_cover_small":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510494395932_SMALL.JPG",
    "domain": "http:\/\/www.taoju5.com"
  },
  {
    "pic_id": 3419,
    "pic_spec": "6240*4160",
    "pic_cover":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510493877515.JPG",
    "pic_cover_long":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510493877515.JPG",
    "pic_cover_big":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510493877515_BIG.JPG",
    "pic_cover_mid":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510493877515_MID.JPG",
    "pic_cover_small":
        "http:\/\/www.taoju5.com\/upload\/common\/2020090510493877515_SMALL.JPG",
    "domain": "http:\/\/www.taoju5.com"
  }
].map((e) => PictureEntity.fromJson(e)).toList();
