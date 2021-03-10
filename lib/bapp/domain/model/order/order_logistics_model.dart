import 'package:taoju5/utils/json_kit.dart';

class PacketLogisticsModelListWrapper {
  List<PacketLogisticsModel> packetList;

  PacketLogisticsModelListWrapper.fromJson(List json) {
    packetList = JsonKit.asList(json)
        .map((e) => PacketLogisticsModel.fromJson(e))
        .toList();
  }
}

extension PacketLogisticsModelListWrapperKit
    on PacketLogisticsModelListWrapper {
  int get hasSendCount => packetList?.where((e) => e.hasSendOut)?.length ?? 0;
}

class PacketLogisticsModel {
  String name;
  String status;
  String company;
  String no;
  int count;
  List<String> imageList;
  List<PacketStationModel> stationList;

  PacketLogisticsModel.fromJson(Map json) {
    name = json['packet_name'];
    status = json['express_status_name'];
    company = json['express_name'];
    no = json['express_code'];
    count = json['order_goods_num'];
    imageList = JsonKit.asList(json['order_goods_picture'])
        .map((e) => JsonKit.asWebUrl(e))
        .toList()
        .cast<String>();
    stationList = JsonKit.asList(json["express_message"])
        .map((e) => PacketStationModel.fromJson(e))
        .toList();
  }
}

extension PacketLogisticsModelKit on PacketLogisticsModel {
  ///快件是否已发出
  bool get hasSendOut => stationList.length > 0;
}

class PacketStationModel {
  String arriveAt;
  String name;
  String description;

  String get arriveAtDate => arriveAt.split(' ')?.first;
  String get arriveAtTime => arriveAt.split(' ')?.last;

  PacketStationModel.fromJson(Map json) {
    arriveAt = json["AcceptTime"];
    name = json["AcceptStation"];
    description = json["title"];
  }
}
