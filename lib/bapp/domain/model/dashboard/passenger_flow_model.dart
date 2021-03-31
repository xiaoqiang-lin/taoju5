import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/utils/common_kit.dart';
import 'package:taoju5/utils/json_kit.dart';
import 'package:get/get.dart';

class PassengerTurnoverRateModel {
  String description;
  double value;
  Color color;
  bool showTip;

  PassengerTurnoverRateModel(
      {@required this.description,
      @required this.value,
      @required this.color,
      this.showTip = true});
}

class PassengerFlowModel {
  List<int> list;

  List<PassengerDailyFlowModel> data;
  String date;
  PassengerFlowModel.sample() {
    list = [0, 0, 0, 0];
    data = [
      PassengerDailyFlowModel(date: "3.1", value: 2),
      PassengerDailyFlowModel(date: "3.2", value: 4),
      PassengerDailyFlowModel(date: "3.3", value: 5),
      PassengerDailyFlowModel(date: "3.4", value: 4),
      PassengerDailyFlowModel(date: "3.5", value: 3),
      PassengerDailyFlowModel(date: "3.6", value: 7),
      PassengerDailyFlowModel(date: "3.7", value: 8),
      PassengerDailyFlowModel(date: "3.8", value: 1),
    ];
    date = "--:--";
  }

  PassengerFlowModel.fromJson(Map json) {
    list = JsonKit.asList(json["current"]).cast<int>();
    data = JsonKit.asList(json["week"])
        .map((e) => PassengerDailyFlowModel.fromJson(e))
        .where((e) => !GetUtils.isNullOrBlank(e.date))
        .toList();
    date = json["time"];
  }
}

class PassengerDailyFlowModel {
  String date;
  int value;

  PassengerDailyFlowModel({this.date, this.value});

  PassengerDailyFlowModel.fromJson(Map json) {
    date = json["date"];
    value = JsonKit.asInt(json["value"]);
  }
}

extension PassengerFlowModelKit on PassengerFlowModel {
  double get turnoverRate {
    if (GetUtils.isNullOrBlank(list)) return 0.0;
    if (totalCount == 0) return 0.0;

    return turnoverCount / totalCount;
  }

  List<PassengerTurnoverRateModel> get rateData {
    if (totalCount == 0) {
      return [
        PassengerTurnoverRateModel(
            color: BColors.graphColor, description: "暂无数据", value: 100)
      ];
    }
    return [
      PassengerTurnoverRateModel(
          color: BColors.graphColor,
          description: CommonKit.isNullOrZero(unturnoverCount)
              ? ""
              : "未转订单\n $unturnoverCount位 ${(unturnoverRate * 100).toStringAsFixed(2)}%",
          value: unturnoverRate),
      PassengerTurnoverRateModel(
          color: BColors.accentGraphColor,
          description: CommonKit.isNullOrZero(turnoverCount)
              ? ""
              : "转单率\n $turnoverCount位 ${(turnoverRate * 100).toStringAsFixed(2)}%",
          value: turnoverRate)
    ];
  }

  int get totalCount {
    if (GetUtils.isNullOrBlank(list)) return 0;
    return list.reduce((a, b) => a + b) ?? 0;
  }

  int get turnoverCount => list?.last ?? 0;

  int get unturnoverCount => totalCount - turnoverCount;

  double get unturnoverRate => 1 - turnoverRate;
}
