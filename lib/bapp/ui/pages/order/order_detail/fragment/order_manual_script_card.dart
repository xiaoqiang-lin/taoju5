import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';

class OrderManualScriptCard extends GetView<OrderDetailController> {
  const OrderManualScriptCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          !GetUtils.isNullOrBlank(controller.order.manualscriptPictureList),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: BDimens.gap16, vertical: BDimens.gap16),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: BDimens.gap16),
              child: Text("测量手稿:"),
            ),
            Wrap(
              runSpacing: BDimens.gap16,
              spacing: BDimens.gap16,
              children: [
                for (String src in controller.order.manualscriptPictureList)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                        height: 180.h,
                        child: AspectRatio(
                            aspectRatio: 1, child: XPhotoViewer(url: src))),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
