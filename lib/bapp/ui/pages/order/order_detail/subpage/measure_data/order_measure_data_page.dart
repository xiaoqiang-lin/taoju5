import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_type.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/measure_data/order_measure_data_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_future_button.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderMeasureDataPage extends GetView<OrderMeasureDataController> {
  const OrderMeasureDataPage({Key key}) : super(key: key);

  OrderMeasureDataModel get measureData => controller.measureData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        title: Text("测装数据"),
      ),
      body: DefaultTextStyle(
          style: TextStyle(fontSize: BDimens.sp28, color: BColors.textColor),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("空间:${measureData.room}"),
                      Text("窗户:${measureData.windowType}"),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: BDimens.gap20),
                      child: Text("窗型:${measureData.windowPattern}")),
                  Divider(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: BDimens.gap20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("安装方式:${measureData.installMode}"),
                        // Text("产品名称:"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: BDimens.gap20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "安装面材质:${measureData.installationSurfaceMaterial}"),
                        Text("石膏线:${measureData.plasterLine}"),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: BDimens.gap20),
                    child: Row(
                      children: [
                        Text("宽(cm):${measureData.width}"),
                        Visibility(
                            visible:
                                !GetUtils.isNullOrBlank(measureData.widthNote),
                            child: Text("(${measureData.widthNote})"))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: BDimens.gap20),
                    child: Row(
                      children: [
                        Text("宽(cm):${measureData.height}"),
                        Visibility(
                            visible:
                                !GetUtils.isNullOrBlank(measureData.heightNote),
                            child: Text("(${measureData.heightNote})"))
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: BDimens.gap20),
                      child: Text("框内安装面宽度(cm):${measureData.frameWidth}")),
                  Text("窗帘盒宽*高(cm):${measureData.boxSize}"),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: BDimens.gap20),
                      child: Text(
                          "顶/石膏线下到窗户上沿(cm):${measureData.plasterLineHeight}")),
                  Divider(),
                  GetBuilder<OrderMeasureDataController>(
                    id: "deltaY",
                    builder: (_) {
                      return Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: BDimens.gap16),
                                  child:
                                      Text("离地距离(cm):${measureData.deltaY}")),
                              Visibility(
                                  visible: !GetUtils.isNullOrBlank(
                                      measureData?.newDeltaY),
                                  child: Text(
                                      "(原:${measureData.newDeltaY ?? ''})"))
                            ],
                          ),
                          IconButton(
                              icon: Image.asset("assets/images/edit.png"),
                              onPressed: _.openEditDeltaYDialog)
                        ],
                      );
                    },
                  ),
                  GetBuilder<OrderMeasureDataController>(
                    id: "openMode",
                    builder: (_) {
                      return Row(
                        children: [
                          Text("打开方式:${measureData.openModeName}"),
                          Visibility(
                              visible: !GetUtils.isNullOrBlank(
                                  measureData.newOpenMode),
                              child: Text("(原:${measureData.newOpenMode})")),
                          IconButton(
                              icon: Image.asset("assets/images/edit.png"),
                              onPressed: () => Get.toNamed(
                                  BAppRoutes.orderMeasureDataEdit + "/${_.id}",
                                  arguments: OrderType.measureOrder))
                        ],
                      );
                    },
                  ),
                  Divider(),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: BDimens.gap20),
                      child: Text("测量备注记录:${measureData.note}")),
                  Divider(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: BDimens.gap20),
                    child: Wrap(
                      spacing: BDimens.gap16,
                      children: [
                        Text("图片"),
                        for (String src in measureData.pictures)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: 180.h,
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: XPhotoViewer(url: src)),
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: BDimens.gap16),
        child: XFutureButton(
          onFuture: null,
          child: Text("确认"),
        ),
      ),
    );
  }
}
