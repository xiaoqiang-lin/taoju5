/*
 * @Description: 打开方式 安装方式选择
 * @Author: iamsmiling
 * @Date: 2021-01-19 10:30:45
 * @LastEditTime: 2021-02-01 15:33:19
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/window/window_style_model.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/measure_data/order_measure_data_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_style/window_style_selector_controller.dart';

class WindowStyleSelectorBar extends StatelessWidget {
  final String tag;
  const WindowStyleSelectorBar({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WindowStyleSelectorController>(
      tag: tag,
      builder: (_) {
        return Column(
          children: [
            Visibility(
              visible: !Get.isRegistered<OrderMeasureDataController>(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(flex: 1, child: Container(child: Text("安装方式"))),
                      Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              for (WindowInstallModeOptionModel o
                                  in _?.installModeOptionList)
                                Container(
                                  margin: EdgeInsets.only(right: BDimens.gap12),
                                  child: o.isChecked
                                      ? ElevatedButton(
                                          onPressed: () =>
                                              _.selectInstallMode(option: o),
                                          child: Text(o.name))
                                      : OutlinedButton(
                                          onPressed: () =>
                                              _.selectInstallMode(option: o),
                                          child: Text(o.name)),
                                ),
                            ],
                          ))
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(child: Container(child: Text("打开方式")), flex: 1),
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        for (WindowOpenModeOptionModel o
                            in _?.openModeOptionList)
                          Container(
                            margin: EdgeInsets.only(right: BDimens.gap12),
                            child: o.isChecked
                                ? ElevatedButton(
                                    onPressed: () =>
                                        _.selectOpenMode(option: o),
                                    child: Text(o.name))
                                : OutlinedButton(
                                    onPressed: () =>
                                        _.selectOpenMode(option: o),
                                    child: Text(o.name)),
                          ),
                      ],
                    ))
              ],
            ),
            Column(
              children: [
                for (WindowSubopenModeModel e in _?.subopenModeList)
                  Row(
                    children: [
                      Expanded(
                        child: Text(e.title),
                        flex: 1,
                      ),
                      Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              for (WindowSubopenModeOptionModel o
                                  in e.optionList)
                                Container(
                                  margin: EdgeInsets.only(right: BDimens.gap12),
                                  child: o.isChecked
                                      ? ElevatedButton(
                                          onPressed: () => _.selectSubopenMode(
                                              mode: e, option: o),
                                          child: Text(o.name))
                                      : OutlinedButton(
                                          onPressed: () => _.selectSubopenMode(
                                              mode: e, option: o),
                                          child: Text(o.name)),
                                )
                            ],
                          ))
                    ],
                  )
              ],
            )
          ],
        );
      },
    );
  }
}
