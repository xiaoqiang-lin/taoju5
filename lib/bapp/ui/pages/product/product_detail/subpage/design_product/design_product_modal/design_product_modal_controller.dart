import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/base_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/room/room_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_style/window_style_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_register_controller.dart';
import 'package:taoju5/utils/common_kit.dart';

class DesignProductModalController extends GetxController {
  final DesignProductModel designProduct;

  String tag = "";
  DesignProductModalController({@required this.designProduct});
  @override
  void onInit() {
    _initWithPreConfig();
    super.onInit();
  }

  void _initWithPreConfig() {
    if (Get.isRegistered<ProductRegisterController>()) {
      tag = Get.find<ProductRegisterController>().tag;
      ProductDetailController productController =
          Get.find<ProductDetailController>(tag: tag);
      designProduct.productList.forEach((ProductModel product) {
        productController?.attrControllerList?.forEach((e) {
          _parse(product, e);
        });
      });
    }
  }

  void _parse(ProductModel product, GetxController e) {
    // if(product.productType is FinishedProductType){
    //    ProductDetailController productController =
    //       Get.find<ProductDetailController>(tag: tag);

    // }
    if (e is BaseAttrSelectorController && !(e is RoomAttrSelectorController)) {
      CurtainProductAttrAdapterModel attr = CurtainProductAttrAdapterModel(
          id: e?.valueId, value: e?.value, key: e?.key, type: e?.type);
      if (!(product.attrList.any((e) => e.key == attr.key))) {
        product?.attrList?.add(attr);
      }
    }
    if (e is RoomAttrSelectorController) {
      product?.room = e?.value;
      product?.roomId = e?.valueId;
    }
    if (e is SizeSelectorController) {
      product?.width = e?.widthM;
      product?.height = e?.heightM;
      product?.deltaY = e?.deltaY;
      designProduct?.width = CommonKit.isNullOrZero(e?.widthM)
          ? designProduct?.width
          : "${e?.widthM}";
      designProduct?.height = CommonKit.isNullOrZero(e?.heightM)
          ? designProduct?.height
          : "${e?.heightM}";
    }
    if (e is WindowStyleSelectorController) {
      product?.installData = e?.data;
    }
  }
}
