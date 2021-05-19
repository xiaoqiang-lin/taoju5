/*
 * @Description: 测装数据参数
 * @Author: iamsmiling
 * @Date: 2021-05-12 18:02:03
 * @LastEditTime: 2021-05-14 10:44:19
 */
import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_child_open_mode_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_open_mode_entity.dart';
import 'package:taoju5_c/validator/validator.dart';

class MeasureDataParamsEntity extends BaseParamsEntity {
  CurtainMeasureDataAttributeEntity measureData;

  MeasureDataParamsEntity({required this.measureData});
  @override
  Map get params => measureData.params;

  @override
  bool validate() {
    String message = "请完善测装数据";

    List<EmptyValidator> validators = [
      ///校验宽
      EmptyValidator(
          field: measureData.size.width?.toString(),
          errorMessage: message,
          callback: VerifyCallback(onSuccess: () {
            measureData.size.widthError = false;
          }, onFailure: () {
            measureData.size.onWidthError();
          })),

      ///校验高
      EmptyValidator(
          field: measureData.size.height?.toString(),
          errorMessage: message,
          callback: VerifyCallback(onSuccess: () {
            measureData.size.heightError = false;
          }, onFailure: () {
            measureData.size.onHeightError();
          })),
      EmptyValidator(
          field: measureData.size.height?.toString(),
          errorMessage: message,
          callback: VerifyCallback(onSuccess: () {
            measureData.size.heightError = false;
          }, onFailure: () {
            measureData.size.onHeightError();
          })),
    ];

    for (WindowChildOpenModeEntity child in measureData.childOpenModes) {
      // _sizes.add(child.size);
      ///校验子打开方式的宽
      for (WindowOpenModeEntity o in child.options) {
        validators.add(EmptyValidator(
            field: o.size!.width?.toString(),
            errorMessage: message,
            callback: VerifyCallback(onSuccess: () {
              o.size!.widthError = false;
            }, onFailure: () {
              o.size!.onWidthError();
            })));

        ///校验子打开方式的高
        validators.add(EmptyValidator(
            field: o.size!.height?.toString(),
            errorMessage: message,
            callback: VerifyCallback(onSuccess: () {
              o.size!.heightError = false;
            }, onFailure: () {
              o.size!.onHeightError();
            })));
      }
    }
    bool flag = ValidatorManager()

        ///检验空间是否为空
        .addValidator(EmptyValidator(
            field: measureData.room.selectedOption?.name,
            errorMessage: message,
            callback: VerifyCallback(onFailure: () {
              measureData.room.onError();
            })))

        ///检验宽高
        .addValidators(validators)
        .executeAll();
    // if (!flag) throw ArgumentError();
    // return true;
    return flag;
  }
}
