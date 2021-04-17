import 'package:flutter/material.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:get/get.dart';

class SalesAnalysisModel {
  List<CustomerGenderAnalysisModel> genderData = [];
  List<CustomerAgeAnalysisModel> ageData = [
    CustomerAgeAnalysisModel(
        color: const Color(0xFFC5CAE9), name: "20岁以下", value: 0),
    CustomerAgeAnalysisModel(
        color: const Color(0xFF303F9F), name: "20-35岁", value: 0),
    CustomerAgeAnalysisModel(
        color: const Color(0xFF212121), name: "35-50岁", value: 0),
    CustomerAgeAnalysisModel(
        color: const Color(0xFF536DFE), name: "50岁以上", value: 0),
  ];

  List<CustomerProductStylePreferenceAnalysisModel> styleData = [];
  String date;
  SalesAnalysisModel.sample() {
    genderData = [
      CustomerGenderAnalysisModel(
          description: "男性\n0位 0.00%", value: 10, color: BColors.graphColor),
      CustomerGenderAnalysisModel(
          description: "女性\n0位 0.00%",
          value: 25,
          color: BColors.accentGraphColor)
    ];
    // ageData = [
    //   // CustomerAgeAnalysisModel()
    // ];

    styleData = [
      CustomerProductStylePreferenceAnalysisModel(style: "晨露", value: 32),
      CustomerProductStylePreferenceAnalysisModel(style: "雅致", value: 17),
      CustomerProductStylePreferenceAnalysisModel(style: "锦瑟", value: 11),
      CustomerProductStylePreferenceAnalysisModel(style: "L3", value: 69),
      CustomerProductStylePreferenceAnalysisModel(style: "北欧", value: 7),
    ];

    date = "--:--";
  }
  SalesAnalysisModel.fromJson(Map json) {
    List<num> genderList = JsonKit.asList(json["sex"]).cast<num>();
    if (!GetUtils.isNullOrBlank(genderList)) {
      num male = genderList[1] ?? 0;
      num female = genderList[2] ?? 0;

      num total = male + female;
      if (total == 0) {
        genderData.add(CustomerGenderAnalysisModel(
            name: "未知",
            value: 100,
            hasData: false,
            color: BColors.graphColor,
            description: "暂无数据"));
      } else {
        genderData.add(
          CustomerGenderAnalysisModel(
              name: "男性",
              value: male,
              hasData: false,
              color: BColors.graphColor,
              description: male == 0
                  ? ""
                  : "男性\n$male位 ${((male / total) * 100).toStringAsFixed(2)}%"),
        );
        genderData.add(CustomerGenderAnalysisModel(
            name: "女性",
            value: female,
            color: BColors.accentGraphColor,
            description:
                "女性\n$female位 ${((female / total) * 100).toStringAsFixed(2)}%"));
      }
    }

    List<num> ageList = JsonKit.asList(json["sex"]).cast<num>();
    num total =
        GetUtils.isNullOrBlank(ageList) ? 0 : ageList.reduce((a, b) => a + b);
    if (total == 0) {
      ageData = [
        CustomerAgeAnalysisModel(
            color: BColors.graphColor,
            name: "暂无数据",
            value: 100,
            rate: 1.0,
            hasData: false)
      ];
    } else {
      for (int i = 0; i < ageList.length; i++) {
        num val = ageList[i];
        ageData[i].value = val;
        ageData[i].rate = (val / total) ?? 0;
      }
    }

    var style = json["goods"];

    if (style is Map) {
      style.entries.forEach((e) {
        styleData.add(CustomerProductStylePreferenceAnalysisModel(
            style: e.key, value: e.value));
      });
    }
    date = json["time"];
  }
}

class CustomerGenderAnalysisModel {
  String name;
  num value;
  String description;
  Color color;
  bool hasData;
  CustomerGenderAnalysisModel(
      {this.name,
      this.value,
      this.description,
      this.color,
      this.hasData = true});
  CustomerGenderAnalysisModel.fromJson(Map json) {
    name = json["0"];
  }
}

class CustomerAgeAnalysisModel {
  String name;
  num value;

  double rate = 0.0;

  Color color;
  bool hasData;

  CustomerAgeAnalysisModel(
      {this.name, this.value, this.color, this.rate, this.hasData = true});
  CustomerAgeAnalysisModel.fromJson(Map json) {
    name = json["0"];
  }
}

extension CustomerAgeAnalysisModelKit on CustomerAgeAnalysisModel {
  String get description => CommonKit.isNullOrZero(rate)
      ? ""
      : "$name\n ${((rate ?? 0.0) * 100).toStringAsFixed(2)}% ${hasData ? value : 0}位";
}

class CustomerProductStylePreferenceAnalysisModel {
  String style;
  num value;
  CustomerProductStylePreferenceAnalysisModel({this.style, this.value});
  CustomerProductStylePreferenceAnalysisModel.fromJson(Map json) {
    style = json["name"];
    value = json["value"];
  }
}
