/*
 * @Description: 城市选择
 * @Author: iamsmiling
 * @Date: 2020-11-28 23:11:50
 * @LastEditTime: 2021-04-18 08:32:11
 */

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'data.dart';

typedef ValueChanged = AddressEntity? Function(Map map);

List<Map> quertProviceList() => proviceData["RECORDS"];

///[description]: 查找城市列表
///[params]: provinceId 选中的城市列表
///[return]: 当前省份下的所有城市
List<Map>? queryCityList(int? provinceId) {
  ///使用set集合可以过滤重复
  Set<Map> citySet = {};
  List<Map> data = cityData["RECORDS"];
  for (int i = 0; i < data.length; i++) {
    Map item = data[i];
    if (item["province_id"] == provinceId) {
      citySet.add(item);
    }
  }
  return citySet.toList();
}

List<Map>? queryDistrictList(int? cityId) {
  Set<Map> districtSet = {};
  List<Map> data = districtData["RECORDS"];
  for (int i = 0; i < data.length; i++) {
    Map item = data[i];
    if (item["city_id"] == cityId) {
      districtSet.add(item);
    }
  }
  return districtSet.toList();
}

int? getProvinceIdByName(String? name) {
  if (name == null || name.isEmpty) return null;
  List<Map> list = quertProviceList();
  for (int i = 0; i < list.length; i++) {
    Map el = list[i];
    if (RegExp(name).hasMatch(el["province_name"] ?? "")) {
      return el["province_id"];
    }
  }
  return null;
}

int? getCityIdByName(int? provinceId, String? name) {
  if (name == null || name.isEmpty) return null;
  List<Map>? list = queryCityList(provinceId);
  for (int i = 0; i < list!.length; i++) {
    Map el = list[i];
    if (RegExp(name).hasMatch(el["city_name"] ?? "")) {
      return el["city_id"];
    }
  }
  return null;
}

int? getDistrictIdByName(int? cityId, String? name) {
  if (name == null || name.isEmpty) return null;
  List<Map>? list = queryDistrictList(cityId);
  for (int i = 0; i < list!.length; i++) {
    Map el = list[i];
    if (RegExp(name).hasMatch(el["district_name"] ?? "")) {
      return el["district_id"];
    }
  }
  return null;
}

String? getProvinceNameById(int id) {
  List<Map> list = quertProviceList();
  for (int i = 0; i < list.length; i++) {
    Map el = list[i];
    if (id == el["province_id"]) {
      return el["province_name"];
    }
  }
  return null;
}

String? getCityNameById(int? provinceId, int? cityId) {
  List<Map>? list = queryCityList(provinceId);
  for (int i = 0; i < list!.length; i++) {
    Map el = list[i];
    if (cityId == el["city_id"]) {
      return el["city_name"];
    }
  }
  return null;
}

String? getDistrictNameById(int? provinceId, int? cityId, int? districtId) {
  if (cityId == null) return null;
  List<Map>? list = queryDistrictList(cityId);
  for (int i = 0; i < list!.length; i++) {
    Map el = list[i];
    if (districtId == el["district_id"]) {
      return el["district_name"];
    }
  }
  return null;
}

AddressModel queryByName(
    String provinceName, String cityName, String districtName) {
  int? provinceId = getProvinceIdByName(provinceName);
  int? cityId = getCityIdByName(provinceId!, cityName);
  int? districtId = getDistrictIdByName(cityId!, districtName);
  ProvicneEntity provicneEntity =
      ProvicneEntity(id: provinceId, name: provinceName);
  CityEntity cityEntity = CityEntity(id: cityId, name: cityName);
  DistrictEntity districtEntity =
      DistrictEntity(id: districtId!, name: districtName);
  return AddressModel(
      provicne: provicneEntity, city: cityEntity, district: districtEntity);
}

AddressModel queryById(int provinceId, int cityId, int districtId) {
  String? provinceName = getProvinceNameById(provinceId);
  String? cityName = getProvinceNameById(provinceId);
  String? districtName = getProvinceNameById(provinceId);
  ProvicneEntity provicneEntity =
      ProvicneEntity(id: provinceId, name: provinceName);
  CityEntity cityEntity = CityEntity(id: cityId, name: cityName);
  DistrictEntity districtEntity =
      DistrictEntity(id: districtId, name: districtName);
  return AddressModel(
      provicne: provicneEntity, city: cityEntity, district: districtEntity);
}

abstract class AddressEntity {}

class ProvicneEntity extends AddressEntity {
  int? id;
  String? name;
  ProvicneEntity({@required this.id, @required this.name});
}

class CityEntity extends AddressEntity {
  int? id;
  String? name;
  CityEntity({@required this.id, @required this.name});
}

class DistrictEntity extends AddressEntity {
  int? id;
  String? name;
  DistrictEntity({@required this.id, @required this.name});
}

class AddressModel {
  late ProvicneEntity provicne;
  late CityEntity city;
  late DistrictEntity district;

  @override
  String toString() {
    return "${provicne.name ?? ''}${city.name ?? ''}${district.name ?? ''}";
  }

  String get address =>
      "${provicne.name ?? ''}${city.name ?? ''}${district.name ?? ''}";
  AddressModel(
      {required this.provicne, required this.city, required this.district});

  AddressModel.fromId(int? provinceId, int? cityId, int? districtId) {
    if (provinceId == 0 || provinceId == null) {
      provinceId = 1;
    }
    if (cityId == 0 || cityId == null) {
      cityId = queryCityList(provinceId)?.first["city_id"];
    }
    if (districtId == 0 || districtId == null) {
      districtId = queryDistrictList(cityId)?.first["district_id"];
    }

    provicne =
        ProvicneEntity(id: provinceId, name: getProvinceNameById(provinceId));
    city = CityEntity(id: cityId, name: getCityNameById(provinceId, cityId));
    district = DistrictEntity(
        id: districtId,
        name: getDistrictNameById(provinceId, cityId, districtId));
  }

  AddressModel.fromName(
      String? provinceName, String? cityName, String? districtName) {
    int? provinceId = getProvinceIdByName(provinceName);
    int? cityId = getCityIdByName(provinceId, cityName);
    int? districtId = getDistrictIdByName(cityId, districtName);

    provicne = ProvicneEntity(id: provinceId, name: provinceName);
    city = CityEntity(id: cityId, name: getCityNameById(provinceId, cityId));
    district = DistrictEntity(
        id: districtId,
        name: getDistrictNameById(provinceId!, cityId!, districtId!));
  }
}

Future cshowCityPicker(BuildContext context, {AddressModel? addressResult}) {
  return showCupertinoModalPopup<AddressModel>(
      context: context,
      builder: (BuildContext context) {
        return _XCityPicker(
          addressResult: addressResult,
        );
      });
}

class _XCityPicker extends StatefulWidget {
  late final AddressModel? addressResult;
  _XCityPicker({
    Key? key,
    this.addressResult,
  }) : super(key: key);

  @override
  _XCityPickerState createState() => _XCityPickerState();
}

class _XCityPickerState extends State<_XCityPicker> {
  late FixedExtentScrollController provinceController;
  late FixedExtentScrollController cityController;
  late FixedExtentScrollController districtController;

  AddressModel? get addressResult => widget.addressResult;

  ProvicneEntity? get provinceEntity => addressResult?.provicne;
  CityEntity? get cityEntity => addressResult?.city;
  DistrictEntity? get districtEntity => addressResult?.district;

  int? get defaultProvinceId => provinceEntity?.id;
  int? get defaultCityId => cityEntity?.id;
  int? get defaultDistrictId => districtEntity?.id;

  ///[targetProvinceId]当前选中的省份id
  late int targetProvinceId;

  ///[targetCityId]当前选中的城市id
  late int targetCityId;

  ///[targetDistrictId]当前选中的区id
  late int targetDistrictId;

  /// [用于构件城市列表]-->StreamBuilder
  late StreamController<List<Map>?> cityStramController;

  late StreamController<List<Map>?> distrctStreamController;

  @override
  void initState() {
    super.initState();
    targetProvinceId = provinceEntity?.id ?? 1;
    targetCityId = cityEntity?.id ?? 1;
    targetDistrictId = districtEntity?.id ?? 1;
    provinceController =
        FixedExtentScrollController(initialItem: _getInitialProviceIndex());
    cityController =
        FixedExtentScrollController(initialItem: _getInitialCityIndex());
    districtController =
        FixedExtentScrollController(initialItem: _getInitialDistrictIndex());

    cityStramController = StreamController<List<Map>>();
    distrctStreamController = StreamController<List<Map>>();
  }

  @override
  void dispose() {
    provinceController.dispose();
    cityController.dispose();
    districtController.dispose();
    cityStramController.close();
    distrctStreamController.close();
    super.dispose();
  }

  int _getInitialProviceIndex() {
    if (defaultProvinceId == null) return 0;
    List list = quertProviceList();
    for (int i = 0; i < list.length; i++) {
      Map el = list[i];
      if (el["province_id"] == defaultProvinceId) return i;
    }
    return 0;
  }

  int _getInitialCityIndex() {
    if (defaultCityId == null) return 0;
    List? list = queryCityList(defaultProvinceId);
    if (list == null) return 0;
    for (int i = 0; i < list.length; i++) {
      Map el = list[i];
      if (el["city_id"] == defaultCityId) return i;
    }
    return 0;
  }

  int _getInitialDistrictIndex() {
    if (defaultDistrictId == null) return 0;
    List? list = queryDistrictList(defaultCityId);
    if (list == null) return 0;
    for (int i = 0; i < list.length; i++) {
      Map el = list[i];
      if (el["district_id"] == defaultDistrictId) return i;
    }
    return 0;
  }

  ProvicneEntity? _onProvinceChange(Map map) {
    targetProvinceId = map["province_id"];
    // _updateCityAndDistrcitData(targetProvinceId);
    List<Map>? cityList = queryCityList(targetProvinceId);

    targetCityId = cityList?.first["city_id"];
    _onCityChange(cityList?.first);

    List<Map>? districtList = queryDistrictList(targetCityId);
    if (districtList == null) return null;
    if (districtList.isNotEmpty) {
      _onDistrictChange(districtList.first);
    }
    cityStramController.add(cityList);
    distrctStreamController.add(districtList);
    // Future.delayed(Duration(milliseconds: 800), () {
    //   _onDistrictChange(districtList?.first);
    // });
    return ProvicneEntity(id: map["province_id"], name: map["province_name"]);
  }

  // void _updateCityAndDistrcitData(int provinceId) {}

  // void _updateDistrictData(int cityId) {}

  CityEntity? _onCityChange(Map? map) {
    if (map == null) return null;
    targetCityId = map["city_id"];
    // _updateDistrictData(targetCityId);
    List<Map>? districtList = queryDistrictList(targetCityId);

    distrctStreamController.add(queryDistrictList(targetCityId));
    if (districtList == null) return null;
    if (districtList.isNotEmpty) {
      _onDistrictChange(districtList.first);
    }

    return CityEntity(id: map["city_id"], name: map["city_name"]);
  }

  DistrictEntity _onDistrictChange(Map map) {
    targetDistrictId = map["district_id"];
    return DistrictEntity(id: map["district_id"], name: map["district_name"]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(7), topLeft: Radius.circular(7)),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * .64,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(7), topLeft: Radius.circular(7)),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 44,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "请选择地址",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text(
                          "取消",
                          style: TextStyle(fontSize: 14),
                        )),
                  )
                ],
              ),
              Expanded(
                  child: Row(
                children: [
                  Flexible(
                    child: _PickerView(
                      key: Key('provice'),
                      itemList: proviceData["RECORDS"],
                      onChange: _onProvinceChange,
                      field: "province_name",
                      controller: provinceController,
                    ),
                  ),
                  Flexible(
                    child: StreamBuilder(
                        stream: cityStramController.stream,
                        initialData: queryCityList(targetProvinceId),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return _PickerView(
                            key: ValueKey(snapshot.data.toString()),
                            itemList: snapshot.data,
                            onChange: _onCityChange,
                            field: "city_name",
                            controller: cityController,
                          );
                        }),
                  ),
                  Flexible(
                    child: StreamBuilder(
                        stream: distrctStreamController.stream,
                        initialData: queryDistrictList(targetCityId),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return _PickerView(
                            key: Key(snapshot.data.toString()),
                            itemList: snapshot.data,
                            onChange: _onDistrictChange,
                            field: "district_name",
                            controller: districtController,
                          );
                        }),
                  ),
                ],
              ))
            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            height: kBottomNavigationBarHeight,
            margin: EdgeInsets.only(bottom: 13),
            child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(AddressModel.fromId(
                    targetProvinceId, targetCityId, targetDistrictId)),
                child: Text("确定")),
          ),
        ),
      ),
    );
  }
}

class _PickerView extends StatefulWidget {
  ///[itemList]选项列表
  final String field;
  final List<Map> itemList;
  final ValueChanged? onChange;
  final FixedExtentScrollController controller;
  _PickerView(
      {Key? key,
      required this.itemList,
      required this.onChange,
      required this.controller,
      required this.field})
      : super(key: key);

  @override
  __PickerViewState createState() => __PickerViewState();
}

class __PickerViewState extends State<_PickerView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SizedBox.expand(
        child: CupertinoPicker.builder(
            scrollController: widget.controller,
            childCount: widget.itemList.length,
            itemExtent: 40,
            onSelectedItemChanged: (int index) {
              Map map = widget.itemList[index];
              if (widget.onChange == null) return;
              widget.onChange!(map);
            },
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Text(widget.itemList[index][widget.field],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12)),
              );
            }),
      ),
    );
  }
}