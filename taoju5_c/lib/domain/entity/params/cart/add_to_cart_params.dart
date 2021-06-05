/*
 * @Description: 添加到购物车里面的参数
 * @Author: iamsmiling
 * @Date: 2021-04-27 15:44:23
 * @LastEditTime: 2021-05-31 11:23:00
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

  MatchingSetParamsEntity? matchingSet;

  int? measureId;

  bool lengthError = false;

  ShakeAnimationController lengthController = ShakeAnimationController();

  ///参数是否填写完整
  bool finished = false;

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

  AddToCartParamsEntity(
      {required this.product,
      this.matchingSet,
      this.measureId,
      this.finished = false});
  @override
  Map get params {
    Map map = {
      "goods_id": product.id,
      "cart_tag": "app",
      "sku_id": product.currentSku?.id,
      "num": product.count,
      "sku_name": product.currentSku?.name,
      "measure_id": measureId ?? -1,
      "estimated_price": product.price,
      "length": product.length,
      "process_method": matchingSet?.attribute.craft.selectedOption?.id
    };
    if (product.productType is FinishedProductType) {
      map.addAll({"estimated_price": product.currentSku?.price});
      return map;
    }
    if (matchingSet != null) {
      map.addAll(matchingSet!.params);
    }
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
      // flag = validatorManager.addValidators([
      //   ///校验宽
      //   EmptyValidator(
      //       field:product.width?.toString(),
      //       errorMessage: "宽度不能为空哦",
      //       callback: VerifyCallback(onSuccess: () {
      //         measureData.size.widthError = false;
      //       }, onFailure: () {
      //         measureData.size.onWidthError();
      //       })),

      //   ///校验高
      //   EmptyValidator(
      //       field: measureData.size.height?.toString(),
      //       errorMessage: message,
      //       callback: VerifyCallback(onSuccess: () {
      //         measureData.size.heightError = false;
      //       }, onFailure: () {
      //         measureData.size.onHeightError();
      //       })),
      // ]).executeAll();
    } else if (product.productType is FabricCurtainProductType) {
      flag = validatorManager
              .addValidator(EmptyValidator(
                  field: measureId?.toString(), errorMessage: "测量id不能为空"))
              .executeAll() &&
          (matchingSet == null ? true : matchingSet!.validate());
    }
    finished = flag;
    if (flag) return true;
    throw ArgumentError("购物车参数错误");
  }
}
