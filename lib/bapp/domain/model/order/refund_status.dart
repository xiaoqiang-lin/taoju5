/*
 * @Description: 退款状态
 * @Author: iamsmiling
 * @Date: 2021-01-06 16:28:06
 * @LastEditTime: 2021-01-15 09:57:25
 */
enum RefundStatus {
  refundable,
  toBeAuthed,
  succeed,
  failed,
}

// 0=默认  1=取消待审核  5=取消商品成功 13=取消订单待工程部审核 14=工程部拒绝取消  -4=取消品牌已拒绝
RefundStatus getRefundStatus(int code) {
  Map<int, RefundStatus> map = {
    -4: RefundStatus.failed,
    0: RefundStatus.refundable,
    1: RefundStatus.toBeAuthed,
    5: RefundStatus.succeed,
    14: RefundStatus.failed,
    13: RefundStatus.toBeAuthed,
  };
  return map[code] ?? RefundStatus.refundable;
}
