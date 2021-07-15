/*
 * @Description: 物流包裹
 * @Author: iamsmiling
 * @Date: 2021-05-20 14:37:48
 * @LastEditTime: 2021-06-21 10:17:02
 */

import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/res/R.dart';

class PackageEntity {
  late String productName;

  late String status;
  late String orderNo;

  ///物流公司
  late String company;

  late List<PackageLogisticsNodeEntity> _nodes;

  late List<PackageProductEntity> products;

  late String telephone;

  bool expand = false;

  double get lineHeight {
    double h = 0.0;
    for (PackageLogisticsNodeEntity node in nodes) {
      h += node != nodes.last ? (node.renderBox?.size.height ?? 0) : 0;
    }
    return h;
  }

  bool get canExpand => _nodes.length > 3;

  List<PackageLogisticsNodeEntity> get nodes =>
      expand ? _nodes : _nodes.sublist(0, min(3, _nodes.length));

  List<PackageLogisticsNodeEntity> get collapseNodes {
    if (_nodes.length <= 3) return [];
    return _nodes.sublist(3);
  }

  PackageEntity.fromJson(Map json, {bool expand = true}) {
    productName = json["packet_name"];
    status = json["express_status_name"];
    company = json["express_name"];
    telephone = json["phone"];
    orderNo = json["express_code"];
    products = JsonKit.asList(json["order_goods"])
        .map((e) => PackageProductEntity.fromJson(e))
        .toList();
    _nodes = JsonKit.asList(json["express_message"])
        .map((e) => PackageLogisticsNodeEntity.fromJson(e))
        .toList();
    // this.expand = false;

    if (_nodes.isNotEmpty) {
      _nodes.first.highlighted = true;
    }
  }
}

class PackageProductEntity {
  late String name;
  late String image;
  PackageProductEntity.fromJson(Map json) {
    name = json["goods_name"];
    image = json["image"];
  }
}

class PackageLogisticsNodeEntity {
  late String status;

  late String date;

  late String description;

  bool highlighted = false;

  double height = 0.0;

  bool updated = false;

  RenderBox? renderBox;
  RegExp exp = new RegExp(r"1[0-9]\d{9}$");

  TapGestureRecognizer recognizer = TapGestureRecognizer();
  PackageLogisticsNodeEntity.fromJson(Map json) {
    status = json["title"];
    date = json["AcceptTime"];
    description = json["AcceptStation"];
  }

  Widget get icon {
    if (status.isEmpty) {
      return Image.asset(R.image.logisticsNodeWithTail);
    }
    if (highlighted) {
      return Image.asset(R.image.logisticsNodeHighlighted);
    }
    return Image.asset(R.image.logisticsNode);
  }

  List<String> get slices {
    String val = description;

    List<String> list = [];

    int index = val.indexOf(exp);
    if (index != -1) {
      list.add(val.substring(0, index));
      list.add(val.substring(index, index + 11));
      if (index + 11 != val.length) {
        list.add(val.substring(index + 11));
      }
    } else {
      list.add(description);
    }
    return list;
  }
}
