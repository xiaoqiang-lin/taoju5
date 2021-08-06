/*
 * @Description: 淘学院
 * @Author: iamsmiling
 * @Date: 2021-04-21 13:49:59
 * @LastEditTime: 2021-07-23 17:51:14
 */
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class CourseListWrapperEntity {
  late List<CourseEntity> list;
  late int totalPage;

  CourseListWrapperEntity.fromJson(Map json) {
    list = JsonKit.asList(json["data"])
        .map((e) => CourseEntity.fromJson(e))
        .toList();
    totalPage = json["page_count"];
  }
}

class CourseEntity {
  late int id;
  late String cover;
  late String title;
  late bool isVideo;
  late double ratio;
  late String href;
  late String size;
  late String description;
  int? type;

  CourseEntity(
      {required this.id,
      required this.cover,
      required this.isVideo,
      required this.ratio,
      required this.title,
      this.type,
      required this.href});

  CourseEntity.fromJson(Map json) {
    id = json["article_id"];
    cover = JsonKit.asWebUrl(json["image"]);
    isVideo = json["article_type"] == 2;
    size = json["pic_spec"] ?? "";
    title = json["title"];
    description = json["browse"];
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
