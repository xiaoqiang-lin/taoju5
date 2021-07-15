/*
 * @Description: 窗帘配套参数校验
 * @Author: iamsmiling
 * @Date: 2021-05-14 10:10:21
 * @LastEditTime: 2021-07-08 15:18:56
 */

import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/validator/validator.dart';

class MatchingSetParamsEntity extends BaseParamsEntity {
  late CurtainMatchingSetAttributeEntity attribute;

  MatchingSetParamsEntity({required this.attribute, this.finished = false});
  @override
  Map get params => {
        "craft_id": attribute.craft.selectedOption?.id ?? 0,
        "process_method": "${attribute.craft.selectedOption?.id ?? 0}",
        "wc_attr": {
          "craft_id": [attribute.craft.selectedOption?.id ?? 0],
          "gauze_id": [attribute.gauze.selectedOption?.id ?? 0],
          "parts_id": [attribute.sectionalbar.selectedOption?.id ?? 0],
          "curtain_id": [attribute.valance.selectedOption?.id ?? 0],
          "lining_id": [attribute.riboux.selectedOption?.id ?? 0],
        }
      };
  bool finished = false;

  @override
  bool validate() {
    List<EmptyValidator> validators = [];

    for (CurtainAddtionalProductEntity item in attribute.attributes) {
      if (item.isRequired) {
        validators.add(EmptyValidator(
            field: item.selectedOption?.toString(),
            errorMessage: "${item.label}不能为空哦",
            callback: VerifyCallback(onFailure: () {
              item.onError();
            }, onSuccess: () {
              item.hasError = false;
            })));
      }
    }

    bool flag = ValidatorManager().addValidators(validators).executeAll();
    if (flag) return true;
    throw ArgumentError("参数错误");
  }
}
