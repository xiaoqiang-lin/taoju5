/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-28 16:52:17
 * @LastEditTime: 2021-04-29 14:49:42
 */
import 'dart:async';

import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/address/poi_entity.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bmflocation/bdmap_location_flutter_plugin.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bmflocation/flutter_baidu_location.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bmflocation/flutter_baidu_location_android_option.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bmflocation/flutter_baidu_location_ios_option.dart';

class LocationController extends GetxController {
  double latitude = 39.917215;
  double longitude = 116.380341;

  late BMFMapController _locationController;

  BMFMapOptions get mapOptions => BMFMapOptions(
      center: BMFCoordinate(latitude, longitude),
      zoomLevel: 18,
      minZoomLevel: 16,
      maxZoomLevel: 20,
      mapPadding: BMFEdgeInsets(left: 30, top: 0, right: 30, bottom: 0));
  BMFMarker get marker => BMFMarker(
      position: BMFCoordinate(latitude, longitude),
      title: 'flutterMaker',
      identifier: 'flutter_marker',
      // isLockedToScreen: true,
      draggable: true,
      icon: "resources/images/3.0x/location_marker.png");

  List<POIEntity> pois = [];

  LocationFlutterPlugin _locationPlugin = new LocationFlutterPlugin();

  late StreamSubscription<Map<String, Object>> _locationListener;

  onBMFMapCreated(BMFMapController controller) {
    _locationController = controller;
    _locationController.setMapRegionDidChangeWithReasonCallback(callback:
        (BMFMapStatus mapStatus, BMFRegionChangeReason regionChangeReason) {
      marker.updatePosition(mapStatus.targetGeoPt);
      _locationController.updateMapOptions(mapOptions);
      print("-------执行");
    });
    controller.showUserLocation(true);
    controller.addMarker(marker);
  }

  search(BMFPoiCitySearchOption option) async {
    // 检索实例
    BMFPoiCitySearch poiCitySearch = BMFPoiCitySearch();
    poiCitySearch.onGetPoiCitySearchResult(
        callback: (BMFPoiSearchResult result, BMFSearchErrorCode errorCode) {
      print(result.toMap());
      Map json = result.toMap();
      pois = JsonKit.asList(json["poiInfoList"])
          .map((e) => POIEntity.fromJson(e))
          .toList();
      print(pois);
      update();
    });
    bool flag = await poiCitySearch.poiCitySearch(option);
  }

  Map<String, Object> _loationResult = {};
  late BaiduLocation _baiduLocation;
  @override
  void onInit() {
    search(BMFPoiCitySearchOption(city: '北京', keyword: '小吃', pageSize: 20));
    _locationPlugin = new LocationFlutterPlugin();

    /// 动态申请定位权限
    _locationPlugin.requestPermission().then((var flag) {
      print(flag);
      if (flag is bool && flag) {
        _setLocOption();
        _locationPlugin.startLocation().then((value) {
          print("_____________");
          print(value);
        });
      }
    });

    _locationListener =
        _locationPlugin.onResultCallback().listen((Map<String, Object> result) {
      _loationResult = result;
      try {
        _baiduLocation = BaiduLocation.fromMap(result);
        latitude = _baiduLocation.latitude;
        longitude = _baiduLocation.longitude;
        // _locationController.updateMapOptions(mapOptions);
        // _locationController.showUserLocation(true);
        // _locationController.removeMarker(marker);
        // _locationController.addMarker(marker);

        // marker.updatePosition(BMFCoordinate(latitude, longitude));
        // update();
        // _locationController.addMarker(marker);
        search(BMFPoiCitySearchOption(
            isCityLimit: true,
            city: _baiduLocation.city,
            keyword: "${_baiduLocation.poiList}"));
      } catch (e) {
        print(e);
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    // _locationListener.cancel();
    _locationPlugin.stopLocation();
    super.onClose();
  }

  /// 设置android端和ios端定位参数
  void _setLocOption() {
    /// android 端设置定位参数
    BaiduLocationAndroidOption androidOption = new BaiduLocationAndroidOption();
    androidOption.setCoorType("bd09ll"); // 设置返回的位置坐标系类型
    androidOption.setIsNeedAltitude(true); // 设置是否需要返回海拔高度信息
    androidOption.setIsNeedAddres(true); // 设置是否需要返回地址信息
    androidOption.setIsNeedLocationPoiList(true); // 设置是否需要返回周边poi信息
    androidOption.setIsNeedNewVersionRgc(true); // 设置是否需要返回最新版本rgc信息
    androidOption.setIsNeedLocationDescribe(true); // 设置是否需要返回位置描述
    androidOption.setOpenGps(true); // 设置是否需要使用gps
    androidOption.setLocationMode(LocationMode.Hight_Accuracy); // 设置定位模式
    androidOption.setScanspan(1000 * 30); // 设置发起定位请求时间间隔
    Map androidMap = androidOption.getMap();

    /// ios 端设置定位参数
    BaiduLocationIOSOption iosOption = new BaiduLocationIOSOption();
    iosOption.setIsNeedNewVersionRgc(true); // 设置是否需要返回最新版本rgc信息
    iosOption.setBMKLocationCoordinateType(
        "BMKLocationCoordinateTypeBMK09LL"); // 设置返回的位置坐标系类型
    iosOption.setActivityType("CLActivityTypeAutomotiveNavigation"); // 设置应用位置类型
    iosOption.setLocationTimeout(10); // 设置位置获取超时时间
    iosOption.setDesiredAccuracy("kCLLocationAccuracyBest"); // 设置预期精度参数
    iosOption.setReGeocodeTimeout(10); // 设置获取地址信息超时时间
    iosOption.setDistanceFilter(100); // 设置定位最小更新距离
    iosOption.setAllowsBackgroundLocationUpdates(true); // 是否允许后台定位
    iosOption.setPauseLocUpdateAutomatically(true); //  定位是否会被系统自动暂停

    Map iosMap = iosOption.getMap();

    _locationPlugin.prepareLoc(androidMap, iosMap);
  }
}
