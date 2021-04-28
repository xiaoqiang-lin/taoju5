/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-28 16:52:17
 * @LastEditTime: 2021-04-28 17:53:11
 */
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFCoordinate, BMFEdgeInsets;

import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';

class LocationController extends GetxController {
  BMFMapOptions mapOptions = BMFMapOptions(
      center: BMFCoordinate(39.917215, 116.380341),
      zoomLevel: 14,
      minZoomLevel: 10,
      maxZoomLevel: 14,
      mapPadding: BMFEdgeInsets(left: 30, top: 0, right: 30, bottom: 0));

  search() async {
    // 构造检索参数
    BMFPoiCitySearchOption poiCitySearchOption =
        BMFPoiCitySearchOption(city: '北京', keyword: '小吃');
    // 检索实例
    BMFPoiCitySearch poiCitySearch = BMFPoiCitySearch();
    poiCitySearch.onGetPoiCitySearchResult(
        callback: (BMFPoiSearchResult result, BMFSearchErrorCode errorCode) {
      print(result.toMap());
    });
    bool flag = await poiCitySearch.poiCitySearch(poiCitySearchOption);
  }

  @override
  void onInit() {
    search();
    super.onInit();
  }
}
