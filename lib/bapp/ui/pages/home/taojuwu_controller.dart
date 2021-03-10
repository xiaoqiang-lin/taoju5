/*
 * @Description:app
 * @Author: iamsmiling
 * @Date: 2020-12-21 09:21:14
 * @LastEditTime: 2021-02-01 11:15:26
 */

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/domain/model/window/window_style_model.dart';
import 'package:taoju5/bapp/domain/model/window/window_pattern_model.dart';
import 'package:taoju5/bapp/domain/repository/taojuwu/taojuwu_repository.dart';

import 'package:taoju5/utils/x_logger.dart';
// import 'package:taoju5/bapp/ui/pages/home/taoju5_data.dart';
import 'package:taoju5/xdio/x_dio.dart';

class TaojuwuController extends GetxController {
  TaojuwuRepository _repository = TaojuwuRepository();

  ///空间
  CurtainProductAttrModel _room;

  ///窗纱
  CurtainProductAttrModel _gauze;

  ///工艺
  CurtainProductAttrModel _craft;

  ///型材
  CurtainProductAttrModel _sectionalbar;

  ///幔头
  CurtainProductAttrModel _valance;

  ///里布
  CurtainProductAttrModel _riboux;

  ///配饰
  CurtainProductAttrModel _accessory;

  ///窗型 单窗 L型窗 u型窗
  WindowPatternModel _facade;

  ///有无飘窗
  WindowPatternModel _windowBay;

  ///有无盒
  WindowPatternModel _windowBox;

  WindowStyleModel style;
  CurtainProductAttrModel get room => _room.copy();

  CurtainProductAttrModel get gauze => _gauze.copy();

  CurtainProductAttrModel get craft => _craft.copy();

  CurtainProductAttrModel get sectionalbar => _sectionalbar.copy();

  CurtainProductAttrModel get valance => _valance.copy();

  CurtainProductAttrModel get riboux => _riboux.copy();

  CurtainProductAttrModel get accessory => _accessory.copy();

  WindowPatternModel get facade => _facade.copy();

  WindowPatternModel get windowBay => _windowBay.copy();

  WindowPatternModel get windowBox => _windowBox.copy();

  Future _loadData() {
    return _repository.curtainProductAttrs().then((BaseResponse response) {
      if (response.isValid) {
        rootBundle
            .loadString("assets/data/curtain_mode.json")
            .then((String data) {
          Map json = response.data;
          json.addAll(jsonDecode(data));
          _room = CurtainProductAttrModel.fromType(1, json);
          _gauze = CurtainProductAttrModel.fromType(3, json);
          _craft = CurtainProductAttrModel.fromType(4, json);
          _sectionalbar = CurtainProductAttrModel.fromType(5, json);
          _valance = CurtainProductAttrModel.fromType(8, json);
          _riboux = CurtainProductAttrModel.fromType(12, json);
          _accessory =
              CurtainProductAttrModel.fromType(13, json, isMultiple: true);
          _facade = WindowPatternModel.fromJson(json["-5"]);
          _windowBay = WindowPatternModel.fromJson(json["-4"]);
          _windowBox = WindowPatternModel.fromJson(json["-3"]);
          style = WindowStyleModel.fromJson(json);
          // CurtainProductAttrModel gauze =
          //     CurtainProductAttrModel.fromType(1, json);
          // taoju5StorageAccessor().shopCurtainProductAttrs = response.data;
          XLogger.v(response.data);
        });
      }
    });
  }

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }
}
