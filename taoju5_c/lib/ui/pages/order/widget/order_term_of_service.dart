/*
 * @Description: 淘居屋服务条款
 * @Author: iamsmiling
 * @Date: 2021-05-06 16:27:48
 * @LastEditTime: 2021-07-13 11:24:41
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/order/preorder_info_entity.dart';
import 'package:taoju5_c/res/R.dart';

class OrderTermOfServiceSheet extends StatelessWidget {
  final PreOrderInfoEntity order;
  const OrderTermOfServiceSheet({Key? key, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: R.dimen.dp15, horizontal: R.dimen.dp20),
      color: R.color.fff5f5f5,
      child: Text(
        order.promise,
        // """服务承诺：
        //   1. 未量尺前支持7天无理由退货换货;量尺后，取消订单则需承担套餐金额的违约金，具体已门店为准(若超服务范围需含远途路费，作为上门测量所产生的全部费用)；下单生产后取消订单则需承担量尺产品等费用。
        //   2. 24小时售后响应，2个工作日给予解决方案，最终以用户确认满意评价。
        //   3. 客户满足测量条件(硬装结束，地板及门框安装完毕)预约测量;正式选品下单后，20天左右生产完成。""",
        style: TextStyle(
            color: R.color.ff999999, fontSize: R.dimen.sp10, height: 2),
      ),
    );
  }
}
