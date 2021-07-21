/*
 * @Description: 进入选择申请退款商品需要携带的参数
 * @Author: iamsmiling
 * @Date: 2021-07-16 09:28:14
 * @LastEditTime: 2021-07-16 09:31:43
 */
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';

class OrderRefundEntity {
  late CancelOrderReasonEntity reason;
  late List<ProductAdaptorEntity> products;

  OrderRefundEntity({required this.reason, required this.products});
}
