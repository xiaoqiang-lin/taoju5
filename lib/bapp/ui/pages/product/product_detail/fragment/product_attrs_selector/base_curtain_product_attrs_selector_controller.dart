/*
 * @Description: [BaseCurtainProductAttrsSelectorController]定义了一些公用的方法和属性
 * @Author: iamsmiling
 * @Date: 2020-12-23 12:59:27
 * @LastEditTime: 2021-02-01 11:25:15
 */
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base_product_attrs_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/storage/taojuwu_storage.dart';

abstract class BaseCurtainProductAttrsSelectorController
    extends BaseProductAttrsSelectorController {
  Map json = TaojuwuStorageAccessor().shopCurtainProductAttrs;

  CurtainModeAttrModelListWrapper modeListWrapper;

  List<CurtainProductAttrModel> get attrList;

  String get description;

  List<CurtainModeAttrModel> get modeList => modeListWrapper.list;

  String get tip => "${room.currentOptionName}\n宽:$widthMStr米 高:$heightMStr米";

  ///当前的styleId
  int get styleId =>
      modeList.firstWhere((e) => RegExp(style).hasMatch(e.name)).id;

  ///窗型
  String get style =>
      "${windowFacade.typeName}/${windowBay.typeName}/${windowBox.typeName}";

  ///样式
  CurtainProductAttrModel windowFacade;

  ///飘窗
  CurtainProductAttrModel windowBay;

  ///有无盒
  CurtainProductAttrModel windowBox;

  ///空间属性
  CurtainProductAttrModel room;

  ///窗纱
  CurtainProductAttrModel gauze;

  ///工艺
  CurtainProductAttrModel craft;

  ///型材
  CurtainProductAttrModel sectionalBar;

  ///幔头
  CurtainProductAttrModel valance;

  ///里布
  CurtainProductAttrModel riboux;

  ///配饰
  CurtainProductAttrModel accessory;

  ///宽度
  String width = '';

  ///高度
  String height = '';

  ///离地距离
  String groundClearance;

  double get widthCM => double.tryParse(width) ?? 0;

  double get heightCM => double.tryParse(height) ?? 0;

  double get groundClearanceCM => double.tryParse(groundClearance) ?? 0;

  double get widthM => widthCM / 100;

  double get heightM => heightCM / 100;

  String get widthMStr => widthM.toStringAsFixed(2);

  String get heightMStr => heightM.toStringAsFixed(2);

  List<CurtainProductAttrOptionModel> _originCraftOptionList;

  List<CurtainProductAttrOptionModel> _originSectionalBarOptionList;

  bool get isSizeBlank =>
      GetUtils.isNullOrBlank(width) || GetUtils.isNullOrBlank(height);

  bool get hasGauze => !RegExp("不").hasMatch(gauze.currentOptionName);
  bool get hasHole => RegExp("孔").hasMatch(craft.currentOptionName);

  Map get storageData;

  @mustCallSuper
  void initAttrs() {
    modeListWrapper = CurtainModeAttrModelListWrapper.fromJson(json);
    windowFacade = CurtainProductAttrModel.fromType(-5, json);
    windowBay = CurtainProductAttrModel.fromType(-4, json);
    windowBox = CurtainProductAttrModel.fromType(-3, json);
    room = CurtainProductAttrModel.fromType(1, json);

    gauze = CurtainProductAttrModel.fromType(3, json);
    craft = CurtainProductAttrModel.fromType(4, json);
    _originCraftOptionList = craft.optionList;
    sectionalBar = CurtainProductAttrModel.fromType(5, json);
    _originSectionalBarOptionList = sectionalBar.optionList;
    valance = CurtainProductAttrModel.fromType(8, json);
    riboux = CurtainProductAttrModel.fromType(12, json);
    accessory = CurtainProductAttrModel.fromType(13, json, isMultiple: true);
    filterCraft(hasBox: false, hasGauze: hasGauze, model: craft);
    filterSectionalBar(hasBox: false, hasHole: hasHole, model: sectionalBar);
  }

  ///[description]: 选择商品属性
  ///[params]: [options]可以选择的选项,[currentOption]当前选择的选项
  ///[return]: [void]
  void select(CurtainProductAttrModel model,
      {@required CurtainProductAttrOptionModel currentOption}) {
    if (model.isMultiple) {
      currentOption.isChecked = !currentOption.isChecked;
    } else {
      model.optionList.forEach((element) {
        element.isChecked = currentOption == element;
      });
    }

    ///更新价格
    Get.find<ProductDetailController>().update(["totalPrice"]);
    // update();
  }

  ///[description]: 筛选工艺的选项
  ///[params]: [hasGauze]是否需要窗纱 [hasBox]是否有盒 [model]工艺选项的数据持有
  ///[return]: [model]

  CurtainProductAttrModel filterCraft(
      {@required bool hasBox,
      @required bool hasGauze,
      @required CurtainProductAttrModel model}) {
    List<CurtainProductAttrOptionModel> list = _originCraftOptionList;
    if (GetUtils.isNullOrBlank(list)) return model;

    ///作为容器存储
    List<CurtainProductAttrOptionModel> options = [];

    ///如果有盒
    if (hasBox) {
      for (CurtainProductAttrOptionModel option in list) {
        if (option.hasTrack) {
          options.add(option);
        }
      }
    } else {
      options = list;
    }

    ///如果不要需要窗纱
    if (!hasGauze) {
      ///不需要窗纱 过滤出单龙马杆
      options = options.where((e) => e.isSinglePole).toList();
    } else {
      ///需要窗纱过滤 双龙马杆
      options = options.where((e) => !e.isSinglePole).toList();
    }

    ///默认选中第一个
    for (int i = 0; i < options?.length; i++) {
      options[i].isChecked = i == 0;
    }

    ///更新列表
    model.optionList = options;
    return model;
  }

  ///[description]: 筛选型材的选项
  ///[params]: [hasGauze]是否需要窗纱  [hasHole]是否打孔 [type]选品时需要用到 [model]型材选项的数据持有
  ///[return]: void
  ///筛选型材
  CurtainProductAttrModel filterSectionalBar(
      {@required bool hasBox,
      @required bool hasHole,
      @required CurtainProductAttrModel model,
      String type}) {
    List<CurtainProductAttrOptionModel> list = _originSectionalBarOptionList;
    if (GetUtils.isNullOrBlank(list)) return model;

    ///作为容器存储
    List<CurtainProductAttrOptionModel> options = [];

    ///如果有盒
    if (hasBox) {
      for (CurtainProductAttrOptionModel option in list) {
        if (option.hasTrack) {
          options.add(option);
        }
      }
    } else {
      options = list;
    }

    //如果需要打孔
    if (hasHole) {
      ///过滤出龙马杆
      options = options.where((e) => e.isDragonHorsePole).toList();
    } else {
      options = options.where((e) => !e.isDragonHorsePole).toList();
    }

    ///根据[type]进行筛选,在选品时会传递这样一个参数
    if (type != null) {
      options = options.where((e) => e.tag == type).toList();
    }
    for (int i = 0; i < options?.length; i++) {
      options[i].isChecked = i == 0;
    }

    model.optionList = options;
    return model;
  }

  ///[description]: 过滤幔布
  ///[params]: [tagId]当前商品的[tagId] [model]幔布选项的数据模型
  ///[return]: [model]
  CurtainProductAttrModel filterValance(
      {@required int tagId, @required CurtainProductAttrModel model}) {
    model.optionList = model.optionList.where((e) => e.tagId == tagId).toList();
    return model;
  }
}
