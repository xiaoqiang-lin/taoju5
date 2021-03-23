import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_mixin_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/base_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/room/room_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_style/window_style_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_register_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';
import 'package:taoju5/utils/common_kit.dart';
import 'package:taoju5/utils/x_logger.dart';
import 'package:taoju5/validator/params_validator.dart';
import 'package:taoju5/xdio/x_dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DesignProductAddToCartParamsModel extends ParamsValidator {
  List<ProductMixinModel> productList;
  String clientId;
  DesignProductAddToCartParamsModel({this.productList}) {
    clientId = Get.find<CustomerProviderController>().id;
  }

  Map get params => {
        "client_uid": clientId,
        "cart_list": productList.map((e) => e.params).toList()
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

  final String id;

  String tag = "";
  DesignProductModalController({@required this.id});

  XLoadState loadState = XLoadState.idle;

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
    if (Get.isRegistered<ProductRegisterController>()) {
      tag = Get.find<ProductRegisterController>().tag;
      print(Get.isRegistered<ProductDetailController>(tag: tag));
      if (Get.isRegistered<ProductDetailController>(tag: tag)) {
        ProductDetailController productController =
            Get.find<ProductDetailController>(tag: tag);
        if (productController.product.productType is CurtainProductType) {
          designProduct?.productList?.forEach((ProductMixinModel product) {
            productController?.attrControllerList?.forEach((e) {
              _parse(product, e);
            });
          });
        }
      }
    }
  }

  void _parse(ProductMixinModel product, GetxController e) {
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

  void select(
      {@required ProductSpecModel spec,
      @required ProductSpecOptionModel option,
      @required String id}) {
    spec?.optionList?.forEach((e) {
      e?.isChecked = e == option;
    });
    update([id]);
  }

  Future addToCart() {
    DesignProductAddToCartParamsModel args = DesignProductAddToCartParamsModel(
        productList: designProduct.productList);
    if (!args.validate()) {
      return Future.value(false);
    }
    // XLogger.v(args.params);
    return _repository.addDesignProductToCart(params: args.params);
    // return Future.value(true);
  }

  Future buy() {
    return Future.value(false);
  }

  Future getMeasureIdList() async {
    designProduct?.productList?.forEach((e) {
      if (e.productType is CurtainProductType) {
        _repository.addMeasureData().then((BaseResponse response) {
          e.measureId = "${response.data}";
        });
      }
    });
  }
}
