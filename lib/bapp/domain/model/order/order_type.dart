/*
 * @Description: 订单类型
 * @Author: iamsmiling
 * @Date: 2020-12-28 10:06:50
 * @LastEditTime: 2021-01-14 14:23:11
 */
import 'order_status.dart';

enum OrderType {
  ///[measureOrder]测量单
  measureOrder,

  ///[selectionOrder]选品单
  selectionOrder,

  ///成品单
  endProductOrder,
}

///[description]: 订单类型归结于[type]和[orderStatus]
///如果code==1,则视为选品单,如果code==2并且还没有选品 则视为测量单 当测量单选品完成后,转化为选品单
///[params]: type orderStatus
///[return]: OrderType
OrderType getOrderType(int type, OrderStatus orderStatus) {
  ///[]
  Map<int, OrderType> map = {
    0: OrderType.endProductOrder,
    1: OrderType.selectionOrder,
    2: OrderType.measureOrder,
  };
  if (type == 2 && orderStatus > OrderStatus.toBeSelected) {
    type = 1;
  }
  return map[type];
}
