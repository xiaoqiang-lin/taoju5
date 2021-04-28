/*
 * @Description: 卷帘
 * @Author: iamsmiling
 * @Date: 2020-12-23 14:03:09
 * @LastEditTime: 2021-04-28 14:54:44
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/dialog/order/edit_deltaY.dart';
import 'package:taoju5/bapp/ui/dialog/product/size/eidt_size.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/utils/common_kit.dart';

class RollingCurtainProductAttrsSelectorController extends GetxController {
  String tag;
  RollingCurtainProductAttrsSelectorController({this.tag});

  SizeSelectorController get _sizeController =>
      Get.find<SizeSelectorController>(tag: tag);

  bool disabled = false;

  String get sizeValue => !(CommonKit.isNullOrZero(_sizeController.widthM) ||
          CommonKit.isNullOrZero(_sizeController.heightM))
      ? "宽:${_sizeController.widthM?.toStringAsFixed(2)}米 高:${_sizeController.heightM?.toStringAsFixed(2)}米"
      : "请输入尺寸";

  String get deltaY => _sizeController.deltaY;

  Future openEditSizeDialog() {
    return showEditSizeDialog(tag: tag).then((value) {
      update();
    });
  }

  Future openEditDeltaYDialog() {
    return showEditDeltaYDialog(initialValue: _sizeController.deltaY)
        .then((value) {
      _sizeController.deltaY = value;
      if (Get.isRegistered<ProductDetailController>(tag: tag)) {
        Get.find<ProductDetailController>(tag: tag)
            .selectProductEvent
            .orderProduct
            .measureData
            .newDeltaY = value;
      }
      update();
    });
  }
  // List<CurtainProductAttrModel> get attrList => [room, windowBay, windowBox];

  // @override
  // void initAttrs() {
  //   // super.initAttrs();
  //   // room = CurtainProductAttrModel.fromType(1, json);
  // }

  // @override
  // void onInit() {
  //   // initAttrs();
  //   super.onInit();
  // }

  // @override
  // Map get storageData {
  //   return {
  //     "room": room.toJson(),
  //     "width": width,
  //     "height": height,
  //     "groundClearance": groundClearance,
  //     "windowBox": windowBox,
  //     "windowFacade": windowFacade,
  //     "windowBay": windowBay,
  //   };
  // }
}
