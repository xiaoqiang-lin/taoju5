import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:get/get.dart';

class OrderEditableBalanceSheet extends GetView<OrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.openModifyPriceModal,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: BDimens.gap4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("尾款:"),
            Spacer(),
            GetBuilder<OrderDetailController>(
                id: "modifyPrice",
                builder: (_) {
                  return Text(
                    "¥${controller.order.balance}",
                    // style:
                    //     TextStyle(fontWeight: FontWeight.w500),
                    style: TextStyle(
                        color: BColors.pinkColor,
                        fontSize: BDimens.sp36,
                        fontWeight: FontWeight.w500),
                  );
                }),
            Container(
              margin: EdgeInsets.only(left: BDimens.gap8),
              child: Text(
                "修改",
                style: TextStyle(
                    color: BColors.greyTextColor, fontSize: BDimens.sp24),
              ),
            ),
            Icon(
              BIcons.next,
              color: BColors.greyTextColor,
              size: BDimens.sp28,
            )
          ],
        ),
      ),
    );
  }
}
