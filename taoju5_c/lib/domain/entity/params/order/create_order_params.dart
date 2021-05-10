/*
 * @Description: 创建订单参数
 * @Author: iamsmiling
 * @Date: 2021-05-06 10:35:11
 * @LastEditTime: 2021-05-07 16:43:25
 */

import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';

class CreateOrderParamsEntity extends BaseParamsEntity {
  int addressId;
  String? orderRemark;
  CreateOrderExtraParamsEntity extra = CreateOrderExtraParamsEntity();

  CreateOrderParamsEntity({required this.addressId, this.orderRemark});

  @override
  Map get params => {
        "address_id": addressId,
        "order_remark": orderRemark,
        "mea_inst_info": extra.params
      };

  @override
  bool validate() => true;
}

class CreateOrderExtraParamsEntity extends BaseParamsEntity {
  String? measureTime;
  String? installTime;

  ///定金默认为100
  double deposit;
  String? windowCount;

  CreateOrderExtraParamsEntity(
      {this.deposit = 100,
      this.installTime,
      this.windowCount,
      this.measureTime});

  @override
  Map get params => {
        "measure_time": measureTime,
        "install_time": installTime,
        "order_earnest_money": deposit,
        "order_window_num": windowCount
      };

  @override
  bool validate() => true;
}
