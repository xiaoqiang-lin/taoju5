import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/order/order_type.dart';
import 'package:taoju5_b/domain/model/product/design_product_model.dart';
import 'package:taoju5_b/domain/model/product/product_detail_model.dart';
import 'package:taoju5_b/domain/model/product/product_mixin_model.dart';
import 'package:taoju5_b/domain/model/product/product_model.dart';
import 'package:taoju5_b/domain/model/product/product_type.dart';
import 'package:taoju5_b/domain/repository/product/product_repository.dart';
import 'package:taoju5_b/routes/bapp_routes.dart';
import 'package:taoju5_b/ui/dialog/product/design_product/design_product_measure_data_confirm.dart';
import 'package:taoju5_b/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5_b/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:taoju5_b/ui/pages/product/cart/subpage/modify_curtain_product_attr/modify_curtain_product_attr_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_attrs_selector/base/base_attr_selector_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_attrs_selector/base/room/room_attr_selector_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_pattern/window_pattern_selector_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_style/window_style_selector_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5_b/ui/widgets/base/x_view_state.dart';
import 'package:taoju5_bc/utils/common_kit.dart';

import 'package:taoju5_b/validator/params_validator.dart';
import 'package:taoju5_b/xdio/x_dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DesignProductAddToCartParamsModel extends ParamsValidator {
  List<ProductMixinModel> productList;
  String clientId;
  DesignProductAddToCartParamsModel({this.productList}) {
    clientId = Get.find<CustomerProviderController>().id;
  }

  Map get params => {
        "client_uid": clientId,
        "cart_list": jsonEncode(productList.map((e) => e.params).toList())
      };

  @override
  bool validate({flag}) {
    if (GetUtils.isNullOrBlank(clientId)) {
      EasyLoading.showInfo("请先选择客户哦");
      return false;
    }
    return true;
  }
}

class DesignProductModalController extends GetxController {
  ProductRepository _repository = ProductRepository();

  DesignProductModel designProduct;

  String id;
  final String fromId;

  String get tag => fromId;
  DesignProductModalController({@required this.fromId, @required this.id});

  XLoadState loadState = XLoadState.busy;

  Future loadData() {
    loadState = XLoadState.busy;
    update();
    return _repository.softDesignProductDetail(params: {"scenes_id": id}).then(
        (DesignProductModel product) {
      designProduct = product;
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    loadData().then((_) {
      _initWithPreConfig();
    });

    super.onInit();
  }

  void _initWithPreConfig() {
    if (Get.isRegistered<ProductDetailController>(tag: tag)) {
      ProductDetailController productController =
          Get.find<ProductDetailController>(tag: tag);
      EditMeasureDataParamsModel measureDataArgs = EditMeasureDataParamsModel(
          tag: tag,
          defaultWidth: designProduct.defaultWidth,
          defaultHeight: designProduct.defaultHeight);

      CurtainProductAtrrParamsModel attributeArgs =
          CurtainProductAtrrParamsModel(tag: tag);

      designProduct?.productList?.forEach((ProductMixinModel product) {
        product.measureData = measureDataArgs.params;
        product.attribute = product.productType is CurtainProductType
            ? jsonEncode(attributeArgs.params)
            : '';
        product.attrList = [];

        productController?.attrControllerList?.forEach((e) {
          _parse(product, e);
        });
      });
    }
  }

  void _parse(ProductMixinModel product, GetxController e) {
    // if(product.productType is FinishedProductType){
    //    ProductDetailController productController =
    //       Get.find<ProductDetailController>(tag: tag);

    // }

    if (e is BaseAttrSelectorController && !(e is RoomAttrSelectorController)) {
      CurtainProductAttrAdapterModel attr = CurtainProductAttrAdapterModel(
          id: e?.valueId,
          value: e?.value,
          key: e?.value,
          type: e?.type,
          price: e?.price,
          typeName: e?.typeName);
      if (!(product.attrList.any((e) => e.key == attr.key))) {
        product?.attrList?.add(attr);
      }
    }
    if (e is RoomAttrSelectorController) {
      product?.room = e?.value;
      product?.roomId = e?.valueId;
    }
    if (e is SizeSelectorController) {
      product?.width = CommonKit.asDouble(e?.width ?? 350);
      product?.height = CommonKit.asDouble(e?.height ?? 265);
      product?.deltaY = e?.deltaY;
    }
    if (e is WindowStyleSelectorController) {
      product?.installData = e?.data;
      product?.installInfo =
          "${e?.style?.name}、${e?.currentInstallModeOption?.name}、${e.openModeName}";
    }
  }

  void select(
      {@required ProductSpecModel spec,
      @required ProductSpecOptionModel option,
      @required String id}) {
    spec?.optionList?.forEach((e) {
      e?.isChecked = e == option;
    });
    update([id]);
  }

  Future addToCart() async {
    return _addToCart();
  }

  Future _addToCart() {
    DesignProductAddToCartParamsModel args = DesignProductAddToCartParamsModel(
        productList: designProduct.productList);
    if (!args.validate()) {
      throw Future.value(false);
    }
    // XLogger.v(args.params);
    return _repository
        .addDesignProductToCart(params: args.params)
        .then((BaseResponse response) {
      CustomerProviderController customerProviderController = Get.find();
      String value = "${response.data}";
      customerProviderController.updateCartCount(value);
    });
    // return Future.value(true);
  }

  Future buy() {
    int count = designProduct?.productList
            ?.where((e) => (e.productType is CurtainProductType &&
                e.isUseDefaultMeasureData))
            ?.length ??
        0;
    if (count > 0) {
      return Future.value().then((value) {
        showDesignProductMeasureDataConfirmDialog(
          count: count,
        ).then((value) {
          if (value == true) {
            return _buy();
          }
        });
      });
    }
    return _buy();
  }

  Future _buy() async {
    return getMeasureIdList().then((value) {
      Get.toNamed(BAppRoutes.commitOrder,
          preventDuplicates: false,
          arguments: CommitOrderEvent(
              productList:
                  designProduct.productList.map((e) => e.adapt()).toList(),
              orderType: OrderType.selectionOrder));
    }).catchError((err) {});
  }

  Future getMeasureIdList() {
    return Future.wait(designProduct?.productList?.map((e) {
      if (e.productType is CurtainProductType) {
        return _repository
            .addMeasureData(params: e.measureData)
            .then((BaseResponse response) {
          e.measureId = "${response.data}";
        }).catchError((err) {
          // return Future.error(err);
        });
      } else {
        return Future.value().then((value) => e.measureId = "0");
      }
    })?.toList());
  }

  Future modifyMeasureData(ProductMixinModel product) {
    return Get.toNamed(BAppRoutes.editMeasureData + "/${product.id}",
            arguments: product, preventDuplicates: false)
        .then((value) {
      if (value != null && value is ModifyCurtainProductAttributeResult) {
        product.measureData = value.measureData ?? product.measureData;
        product.width = value.width ?? product.width;
        product.height = value.height ?? product.height;

        product.attribute = jsonEncode(value.attribute);
        update();
      }
    });
  }

  Future modifyAttribute(ProductMixinModel product) {
    return Get.toNamed(BAppRoutes.modifyCurtainProductAttr,
            arguments: ModifyCurtainProductAttrEvent(
                tag: "${product.id}",
                isFromCart: false,
                productTagId: product.tagId,
                attrList: product.attrList),
            preventDuplicates: false)
        .then((value) {
      if (value != null && value is ModifyCurtainProductAttributeResult) {
        product.attrList = value.attrList;
        product.attribute = jsonEncode(value.attribute);
        // product.width = value.width ?? product.defaultWidth;
        // product.height = value.height ?? product.defaultHeight;
        update();
      }
    });
  }

  _del<T>(String tag) {
    if (Get.isRegistered<T>(tag: tag)) {
      Get.delete<T>(tag: tag, force: true);
    }
  }

  @override
  void onClose() {
    designProduct?.productList?.forEach((e) {
      if (e.productType is CurtainProductType) {
        _del<RoomAttrSelectorController>("${e.id}");
        _del<WindowPatternSelectorController>("${e.id}");
        _del<WindowStyleSelectorController>("${e.id}");
        _del<SizeSelectorController>("${e.id}");
      }
    });
    super.onClose();
  }
}
