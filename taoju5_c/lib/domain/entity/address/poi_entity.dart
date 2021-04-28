/*
 * @Description: POI信息
 * @Author: iamsmiling
 * @Date: 2021-04-28 18:00:42
 * @LastEditTime: 2021-04-28 18:07:23
 */

class POIEntity {
  late String name;
  late GeoCoordinateEntity coordinate;
  late String address;
  late String provice;
  late String city;
  late String area;

  POIEntity.fromJson(Map json) {
    name = json["name"];
    coordinate = GeoCoordinateEntity.fromJson(json["pt"]);
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
