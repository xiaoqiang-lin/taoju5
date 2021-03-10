/*
 * @Description: 客户数据模型
 * @Author: iamsmiling
 * @Date: 2020-12-18 17:55:58
 * @LastEditTime: 2021-01-21 13:19:40
 */

import 'package:azlistview/azlistview.dart';
import 'package:get/get.dart';
import 'package:taoju5/utils/json_kit.dart';

import 'customer_detail_model.dart';

class CustomerModelListWrapper {
  int totalCount;

  int status0Count;
  int status1Count;
  int status2Count;
  int status3Count;

  List<CustomerModel> list;

  CustomerModelListWrapper.fromJson(Map json) {
    totalCount = json['total_count'];

    status0Count = json['status_0'];
    status1Count = json['status_1'];
    status2Count = json['status_2'];
    status3Count = json['status_3'];
    list = JsonKit.asList(json['list'])
        .map((e) => CustomerModel.fromJson(e))
        .toList();
  }
}

extension CustomerModelListWrapperKit on CustomerModelListWrapper {
  List<int> get countList =>
      [status0Count, status1Count, status2Count, status3Count];
}

class CustomerModel implements ISuspensionBean {
  String name;
  String id;

  String headWord;

  String gender;

  ///[wx]微信
  String wx;

  int age;

  String enterTime;

  String intentionProduct;

  String tel;

  String avatar;

  String wanted;

  CustomerModel();
  CustomerAddressModel address;

  @override
  String getSuspensionTag() {
    return headWord;
  }

  CustomerModel.fromJson(Map json) {
    id = "${json['id']}";
    name = json['client_name'];
    headWord = json['head_word'];
    tel = json['client_mobile'];
    gender = json['client_sex'];
    age = json['client_age'];
    wx = json['client_wx'];
    enterTime = json['enter_time'];
    intentionProduct = json['good_category'];
    address = CustomerAddressModel.fromJsom(json);
    wanted = json["good_category"];
  }

  Map toJson() => {"id": id, "name": name};

  @override
  bool isShowSuspension = true;
}

extension CustomerModelKit on CustomerModel {
  String get tag => GetUtils.isAlphabetOnly(headWord) ? headWord : "#";
}
