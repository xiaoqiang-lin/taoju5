/*
 * @Description: POI信息
 * @Author: iamsmiling
 * @Date: 2021-04-28 18:00:42
 * @LastEditTime: 2021-04-29 09:14:58
 */

class POIEntity {
  late String name;
  late GeoCoordinateEntity coordinate;
  late String address;
  late String provice;
  late String city;
  late String district;

  POIEntity.fromJson(Map json) {
    name = json["name"];
    coordinate = GeoCoordinateEntity.fromJson(json["pt"]);
    address = json["address"];
    provice = json["province"];
    city = json["city"];
    district = json["area"];
  }
}

class GeoCoordinateEntity {
  late double latitude;
  late double longitude;
  GeoCoordinateEntity.fromJson(Map json) {
    latitude = json["latitude"];
    longitude = json["longitude"];
  }
}
