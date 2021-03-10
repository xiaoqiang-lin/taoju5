/*
 * @Description: 窗型选择弹窗
 * @Author: iamsmiling
 * @Date: 2021-01-18 17:07:21
 * @LastEditTime: 2021-01-19 14:32:09
 */
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/window/window_pattern_model.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/modal/product/base/x_base_attr_modal.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_pattern/window_pattern_selector_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_check_button.dart';

Future showWindowPatternModal({@required String tag}) {
  return showCupertinoModalPopup(
      context: Get.context,
      builder: (BuildContext context) {
        WindowPatternSelectorController controller =
            Get.find<WindowPatternSelectorController>(tag: tag);

        return WillPopScope(
          onWillPop: controller.onCancel,
          child: XBaseAttrModal(
              title: "窗型选择",
              onConfirm: controller.onConfirm,
              onClose: controller.onCancel,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: GetBuilder<WindowPatternSelectorController>(
                    tag: tag,
                    id: "options",
                    builder: (_) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: BDimens.gap32),
                        child: Column(
                          children: [
                            for (WindowPatternModel e in _.styleList)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: BDimens.gap16),
                                    child: Text(e.title),
                                  ),
                                  Row(
                                    children: [
                                      for (WindowPatternOptionModel o
                                          in e.optionList)
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: BDimens.gap32),
                                          child: XCheckButton(
                                              isChecked: o.isChecked,
                                              height: 156.w,
                                              width: 156.w,
                                              onPresss: () => _.select(e, o),
                                              child: Image.asset(
                                                "assets/images/" + o.img,
                                              )),
                                        )
                                    ],
                                  )
                                ],
                              )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
              height: Get.height * .72),
        );
      });
}
