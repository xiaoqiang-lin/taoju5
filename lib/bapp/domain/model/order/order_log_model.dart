//订单工程部操作日志
import 'package:taoju5/utils/json_kit.dart';

class OrderLogModel {
  List<OrderLogRecordModel> recoredList;

  OrderLogModel.fromJson(List json) {
    recoredList = JsonKit.asList(json)
        .map((e) => OrderLogRecordModel.fromJson(e as Map))
        .toList();
  }
}

class OrderLogRecordModel {
  String username;
  String createAt;
  String description;
  String modifyAt;

  OrderLogRecordModel.fromJson(Map json) {
    username = json["user_name"];
    createAt = json["record_time"];
    description = json["record_name"];
    modifyAt = JsonKit.formatDateTimeFromMillseconds(json["action_time"]);
  }
}
