/*
 * @Description: 物流包裹
 * @Author: iamsmiling
 * @Date: 2021-05-20 14:37:48
 * @LastEditTime: 2021-05-21 18:02:02
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class PackageEntity {
  late String productName;
  late String productImage;

  late String status;
  late String orderNo;

  ///物流公司
  late String company;

  late List<PackageLogisticsNodeEntity> nodes;

  PackageEntity.fromJson(Map json) {
    productName = "BML200201";
    status = "已发货";
    productImage = "https://i.loli.net/2021/04/13/SFUX5qwIz1yRVvJ.png";
    orderNo = "中通快递 ZH122131315632";

    nodes = [
      PackageLogisticsNodeEntity.fromJson({
        "status": "已签收",
        "date": "04-12 18:00",
        "description": "已签收,本人签收,派件员:某某某,电话:13588414007"
      }, highlighted: true),
      PackageLogisticsNodeEntity.fromJson({
        "status": "派送中",
        "date": "04-12 18:00",
        "description": "快递已到达临平分部，派件员:某某某正在为您派送中 电话:13588414007"
      }),
      PackageLogisticsNodeEntity.fromJson({
        "status": "运输中",
        "date": "04-12 18:00",
        "description": "快递已离开上海，下一站杭州临平分部"
      }),
      PackageLogisticsNodeEntity.fromJson({
        "status": "",
        "date": "04-12 18:00",
        "description": "快递已离开上海，下一站杭州临平分部"
      }),
      PackageLogisticsNodeEntity.fromJson({
        "status": "",
        "date": "04-12 18:00",
        "description": "快递已离开上海，下一站杭州临平分部"
      }),
      PackageLogisticsNodeEntity.fromJson({
        "status": "",
        "date": "04-12 18:00",
        "description": "快递已离开上海，下一站杭州临平分部"
      }),
      PackageLogisticsNodeEntity.fromJson({
        "status": "",
        "date": "04-12 18:00",
        "description": "快递已离开上海，下一站杭州临平分部"
      }),
      PackageLogisticsNodeEntity.fromJson(
          {"status": "已揽收", "date": "04-12 18:00", "description": "杭州分拨中心已收寄"}),
    ];
  }
}

class PackageLogisticsNodeEntity {
  late String status;

  late String date;

  late String description;

  late bool highlighted;

  double height = 0.0;

  bool updated = false;

  RenderBox? renderBox;
  RegExp exp = new RegExp(r"1[0-9]\d{9}$");
  PackageLogisticsNodeEntity.fromJson(Map json, {bool highlighted = false}) {
    status = json["status"];
    date = json["date"];
    description = json["description"];
    this.highlighted = highlighted;
  }

  Widget get icon {
    if (status.isEmpty) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: R.dimen.dp12),
        width: R.dimen.dp10,
        height: R.dimen.dp10,
        decoration: BoxDecoration(
            color: R.color.ffe5e5e5,
            borderRadius: BorderRadius.circular(R.dimen.dp5)),
      );
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
