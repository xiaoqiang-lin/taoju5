/*
 * @Description: 提交订单的提示
 * @Author: iamsmiling
 * @Date: 2021-01-07 22:16:55
 * @LastEditTime: 2021-01-12 20:44:43
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

class CommitOrderTip extends StatelessWidget {
  const CommitOrderTip({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
      margin: EdgeInsets.only(top: BDimens.gap32),
      child: Text(
        """
  服务承诺:
  (1)未量尺前支持7天无理由退货换货；量尺后，取消订单则需承担套餐金额的违约金，具体已门店为准（若超服务范围需含远途路费，作为上门测量所产生的全部费用）；下单生产后，取消订单则需承担量尺、产品等费用。 
  (2)24小时售后响应制，2个工作日给予解决方案，最终以用户确认满意评价。 
  (3)客户满足测量条件（硬装结束，地板及门框安装完毕）预约测量；正式选品下单后，20天左右生产完成。
      
      """,
        style: TextStyle(fontSize: BDimens.gap24, color: BColors.greyTextColor),
      ),
    );
  }
}
