/*
 * @Description: 卷帘
 * @Author: iamsmiling
 * @Date: 2020-12-23 14:03:09
 * @LastEditTime: 2020-12-30 17:47:44
 */

import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base_curtain_product_attrs_selector_controller.dart';

class RollingCurtainProductAttrsSelectorController
    extends BaseCurtainProductAttrsSelectorController {
  ///空间属性
  CurtainProductAttrModel room;

  List<CurtainProductAttrModel> get attrList => [room, windowBay, windowBox];

  @override
  void initAttrs() {
    super.initAttrs();
    room = CurtainProductAttrModel.fromType(1, json);
  }

  @override
  void onInit() {
    initAttrs();
    super.onInit();
  }

  @override
  Map get storageData {
    return {
      "room": room.toJson(),
      "width": width,
      "height": height,
      "groundClearance": groundClearance,
      "windowBox": windowBox,
      "windowFacade": windowFacade,
      "windowBay": windowBay,
    };
  }

  @override
  String get description => "";
}
