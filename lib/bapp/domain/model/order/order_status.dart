/*
 * @Description:订单状态
 * @Author: iamsmiling
 * @Date: 2020-12-28 10:05:30
 * @LastEditTime: 2021-01-05 13:31:49
 */

enum OrderStatus {
  ///[toBeAudited]待审核
  toBeAudited,

  ///[toBeMeasured]待测量
  toBeMeasured,

  ///[toBeSelected]待选品
  toBeSelected,

  ///[toBePaid]待付款
  toBePaid,

  ///[canceled]已取消
  canceled,

  ///[producing]生产中
  producing,

  ///[toBeDelivered]待发货
  toBeDelivered,

  ///[toBeReceived]待收获
  toBeReceived,

  ///[toBeInstalled]待安装
  toBeInstalled,

  ///[finished]已完成
  finished,

  ///[all]全部
  all,

  ///[proccessOn]进行中
  proccessOn,

  ///[aftersell]售后
  aftersell
}

extension OrderStatusKit on OrderStatus {
  bool operator >(OrderStatus state) {
    return this.index > state.index;
  }

  bool operator <(OrderStatus state) {
    return this.index < state.index;
  }

  bool operator <=(OrderStatus state) {
    return this.index <= state.index;
  }

  bool operator >=(OrderStatus state) {
    return this.index >= state.index;
  }

  operator -(OrderStatus state) {
    return this.index - state.index;
  }
}

OrderStatus getOrderStaus(int code) {
////[map]将数字因设为[OrderStatus]
  Map<int, OrderStatus> map = {
    1: OrderStatus.toBeAudited,
    2: OrderStatus.toBeMeasured,
    14: OrderStatus.toBeSelected,
    3: OrderStatus.toBePaid,
    4: OrderStatus.toBePaid,
    5: OrderStatus.producing,
    6: OrderStatus.toBeDelivered,
    15: OrderStatus.toBeReceived,
    7: OrderStatus.toBeInstalled,
    8: OrderStatus.finished,
    9: OrderStatus.canceled,
    10: OrderStatus.aftersell
  };
  return map[code];
}
