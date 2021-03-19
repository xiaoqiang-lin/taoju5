import 'package:taoju5/utils/json_kit.dart';
import 'dart:math' as math;
import 'package:get/get_utils/get_utils.dart';

class SalesAmountModel {
  String name;
  num value;

  SalesAmountModel({this.name, this.value = 0.0});
  SalesAmountModel.fromJson(Map json) {
    name = json["name"];
    value = json["value"];
  }
}

class SalesStatisticsModel {
  List<SalesAmountModel> amountList = [];

  List<ProductSalesStaticsModel> productList = [];

  List<SalesStatisticsYearlyModel> data;

  String date;

  SalesStatisticsModel.sample() {
    amountList = [
      SalesAmountModel(name: "订单总金额"),
      SalesAmountModel(name: "已收金额"),
      SalesAmountModel(name: "未收金额")
    ];
    productList = [
      ProductSalesStaticsModel(name: "窗纱", value: 0),
      ProductSalesStaticsModel(name: "床品", value: 0),
      ProductSalesStaticsModel(name: "晨露", value: 99),
      ProductSalesStaticsModel(name: "雅芝", value: 1999),
      ProductSalesStaticsModel(name: "锦瑟", value: 1999)
    ];
    data = List.generate(
        7,
        (index) => SalesStatisticsYearlyModel(
            date: "-/$index", value: math.sin(index * 3)));

    date = "--:--";
  }

  SalesStatisticsModel.fromJson(Map json) {
    List list = JsonKit.asList(json["money"]).cast<num>();
    amountList = [
      SalesAmountModel(
          name: "订单总金额", value: (list?.first ?? 0.0) + (list?.last ?? 0.0)),
      SalesAmountModel(name: "已收金额", value: list?.first ?? 0.0),
      SalesAmountModel(name: "未收金额", value: list?.last ?? 0.0),
    ];
    data = JsonKit.asList(json["year"])
        .map((e) => SalesStatisticsYearlyModel.fromJson(e))
        .where((e) => !GetUtils.isNullOrBlank(e.date))
        .toList();
    date = json["time"];
    var temp = json["goods"];
    if (temp is Map) {
      temp.entries.forEach((e) {
        productList.add(ProductSalesStaticsModel.fromJson(
            {"name": e.key, "value": e.value}));
      });
    }
  }
}

class SalesStatisticsYearlyModel {
  String date;
  double value;

  SalesStatisticsYearlyModel.fromJson(Map json) {
    date = json["date"];
    value = JsonKit.asDouble(json["value"]);
  }

  SalesStatisticsYearlyModel({this.date = "-/-", this.value = 0});
}

class ProductSalesStaticsModel {
  String name;
  double value;

  ProductSalesStaticsModel({this.name, this.value});
  ProductSalesStaticsModel.fromJson(Map json) {
    name = json["name"];
    value = JsonKit.asDouble(json["value"]);
  }
}
