import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_log_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/order_log/order_log_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';

class OrderLogPage extends GetView<OrderLogController> {
  const OrderLogPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        title: Text("编辑记录"),
      ),
      body: GetBuilder<OrderLogController>(
        builder: (_) {
          return XLoadStateBuilder(
              loadState: _.loadState,
              retry: _.loadData,
              builder: (BuildContext context) {
                return Container(
                  // padding: EdgeInsets.symmetric(horizontal: BDimens.gap16),
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int i) {
                        OrderLogRecordModel record = _.orderLog.recoredList[i];
                        return Container(
                          color: Get.theme.primaryColor,
                          padding: EdgeInsets.symmetric(
                              vertical: BDimens.gap32,
                              horizontal: BDimens.gap32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                record.username,
                                style: TextStyle(fontSize: BDimens.sp30),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: BDimens.gap8),
                                child: Text(
                                  record.description,
                                  style: TextStyle(fontSize: BDimens.sp28),
                                ),
                              ),
                              Text(
                                record.modifyAt,
                                style: TextStyle(
                                    color: BColors.tipColor,
                                    fontSize: BDimens.sp24),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int i) {
                        return Divider();
                      },
                      itemCount: _.orderLog.recoredList.length),
                );
              });
        },
      ),
    );
  }
}
