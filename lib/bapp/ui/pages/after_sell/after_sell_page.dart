/*
 * @Description: 售后
 * @Author: iamsmiling
 * @Date: 2021-01-07 17:55:18
 * @LastEditTime: 2021-01-07 20:49:37
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/ui/pages/after_sell/after_sell_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_future_button.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AfterSellPage extends GetView<AfterSellController> {
  const AfterSellPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        title: Text("售后服务"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: BDimens.gap32),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      "感谢您选择我们的产品!",
                      style: TextStyle(fontSize: BDimens.sp28, height: 2),
                    ),
                    Text(
                      "我们将及时为您处理并反馈结果！",
                      style: TextStyle(fontSize: BDimens.sp28),
                    )
                  ],
                ),
              ),
              GetBuilder<AfterSellController>(
                builder: (_) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: BDimens.gap32),
                          child: Text(
                            "您是否遇到：",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: BColors.inputBorderColor,
                              )),
                          child: Column(
                            children: [
                              for (ServerType type in controller.dict.keys)
                                Row(
                                  children: [
                                    Checkbox(
                                      onChanged: (bool flag) {
                                        _.serverType = flag ? type : null;
                                        _.update(["type"]);
                                      },
                                      value: _.serverType == type,
                                    ),
                                    Text(_.dict[type])
                                  ],
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                id: "type",
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: BDimens.gap32),
                      child: Text(
                        "问题描述:",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: 196.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: BColors.inputBorderColor,
                          )),
                      child: TextFormField(
                        initialValue: controller.description,
                        decoration: InputDecoration(
                            hintText: "请输入问题描述",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: BDimens.gap32),
                      child: Text(
                        "上传图片:",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    GetBuilder<AfterSellController>(
                        id: "image",
                        builder: (_) {
                          return Wrap(
                            runAlignment: WrapAlignment.spaceAround,
                            spacing: BDimens.gap16,
                            runSpacing: BDimens.gap16,
                            children: <Widget>[
                              GestureDetector(
                                onTap: _.showSelectImageModal,
                                child: Container(
                                    width: 196.w,
                                    margin: EdgeInsets.only(top: 12),
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xFFEBECEE).withOpacity(.66),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.asset(
                                        "assets/images/" + "upload_image.png",
                                        color: Colors.grey.withOpacity(.5),
                                      ),
                                    )),
                              ),
                              for (String src in _.imageList)
                                Stack(
                                  children: [
                                    Container(
                                        width: 196.w,
                                        margin: EdgeInsets.only(top: 12),
                                        child: AspectRatio(
                                            aspectRatio: 1,
                                            child: Image.network(src))),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: GestureDetector(
                                        onTap: () => _.remove(src),
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundColor: BColors.maskColor,
                                          child: Icon(
                                            BIcons.close,
                                            color: BColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            ],
                          );
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(
              horizontal: BDimens.gap16, vertical: BDimens.gap16),
          height: kBottomNavigationBarHeight,
          child: XFutureButton(
            onFuture: controller.submit,
            child: Text("提交"),
          )),
    );
  }
}
