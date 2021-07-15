/*
 * @Description: 添加到购物车里面的参数
 * @Author: iamsmiling
 * @Date: 2021-04-27 15:44:23
 * @LastEditTime: 2021-07-08 17:26:02
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';
import 'package:taoju5_c/domain/entity/params/order/matching_set_params.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/utils/toast.dart';
import 'package:taoju5_c/validator/validator.dart';
import 'package:get/get.dart';

class AddToCartParamsEntity extends BaseParamsEntity {
  ProductDetailEntity product;

  bool lengthError = false;

  ShakeAnimationController lengthController = ShakeAnimationController();

  setLength(String val) {
    int maxLength = 99999;
    if (!GetUtils.isNum(val)) {
      ToastKit.warning("请输入正确的高度哦");
      throw ArgumentError.value(val, "height", "请输入正确的高度哦");
    }
    double tmp = CommonKit.asDouble(val);
    if (tmp > maxLength) {
      tmp = maxLength.toDouble();
      ToastKit.warning("高度最多不能超过${maxLength}cm哦");
    }

    product.length = tmp;
  }

  AddToCartParamsEntity({required this.product});
  @override
  Map get params {
    Map map = {
      "goods_id": product.id,
      "cart_tag": "app",
      "sku_id": product.currentSku?.id,
      "num": product.count,
      "sku_name": product.currentSku?.name,
      "measure_id": product.measureId,
      "estimated_price": product.price,
      "length": product.length,
    };
    if (product.productType is FinishedProductType) {
      map.addAll({"estimated_price": product.currentSku?.price});
      return map;
    }
    if (product.productType is FabricScreenProductType) {
      map.addAll({
        "process_method": product.attribute.matchingSet.craft.selectedOption?.id
      });
    }
    MatchingSetParamsEntity arg =
        MatchingSetParamsEntity(attribute: product.attribute.matchingSet);
    map.addAll(arg.params);
    return map;
  }

  @override
  bool validate() {
    ValidatorManager validatorManager = ValidatorManager();
    bool flag = true;
    if (product.productType is SectionbarProductType) {
      flag = validatorManager
          .addValidator(EmptyValidator(
              field: product.length?.toString(),
              errorMessage: "型材长度不能为空哦",
              callback: VerifyCallback(onFailure: () {
                lengthController.start(shakeCount: 1);
                lengthError = true;
              }, onSuccess: () {
                lengthError = false;
              })))
          .executeAll();
    } else if (product.productType is RollingCurtainProductType) {
    } else if (product.productType is FabricCurtainProductType) {
      flag = validatorManager.executeAll() &&
          MatchingSetParamsEntity(attribute: product.attribute.matchingSet)
              .validate();
    }

    if (flag) return true;
    throw ArgumentError("购物车参数错误");
  }
}
