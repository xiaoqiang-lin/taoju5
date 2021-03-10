/*
 * @Description: 编辑客户页面
 * @Author: iamsmiling
 * @Date: 2020-12-22 09:59:00
 * @LastEditTime: 2021-02-02 17:52:28
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taoju5/constants/x_gender.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_edit/customer_edit_controller.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/city_picker/x_city_picker.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_count_picker.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_gender_picker.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_submit_button.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_label_text_field.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_selector_text_field.dart';
import 'package:taoju5/utils/common_kit.dart';

class CustomerEditPage extends GetView<CustomerEditController> {
  const CustomerEditPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(

            ///如果是从商品详情进去 则显示编辑客户 否则显示添加客户
            RegExp(BAppRoutes.customerDetail).hasMatch(Get.routing.previous)
                ? "编辑客户"
                : "添加客户"),
        actions: [
          Visibility(
            visible: Get.parameters["canChoose"] == "1",
            child: TextButton(
                onPressed: () =>
                    Get.toNamed(BAppRoutes.customerList, arguments: true),
                child: Text("选择已有客户")),
          )
        ],
      ),
      body: GetBuilder<CustomerEditController>(builder: (_) {
        return SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Container(
                  color: BColors.pinnedBannerColor,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: BDimens.gap32, vertical: BDimens.gap10),
                  child: Text(
                    "基本信息",
                    style: TextStyle(
                        fontSize: BDimens.sp26, color: BColors.pinnedTextColor),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
                  child: Column(
                    children: [
                      XLabelTextField(
                        label: "姓名",
                        hintText: "2-12个字符（必填）",
                        initialValue: _.target.name,
                        onChanged: (String str) {
                          _.target.name = str;
                        },
                      ),
                      XSelectorTextField<XGender>(
                        label: Text("性别"),
                        onValueChange: (XGender gender) {
                          _.target.gender = gender;
                        },
                        initialValue: _.target.gender,
                        onStringify: getGenderName,
                        onFuture: () => showGenderPicker(context,
                            defaultGender: _.target.gender),
                      ),
                      XSelectorTextField<String>(
                        label: Text("年龄"),
                        initialValue: _.target.age,
                        onValueChange: (String value) {
                          _.target.age = value;
                        },
                        onFuture: () => showCountPicker(context,
                            defaultValue: _.target.age,
                            optionList:
                                List.generate(70, (index) => "${index + 10}")),
                      ),
                      XLabelTextField(
                        label: "手机号",
                        initialValue: _.target.tel,
                        hintText: "（必填）",
                        onChanged: (String str) {
                          _.target.tel = str;
                        },
                      ),
                      XLabelTextField(
                        label: "微信号",
                        hintText: "（选填）",
                        initialValue: _.target.wx,
                        onChanged: (String str) {
                          _.target.wx = str;
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  color: BColors.pinnedBannerColor,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: BDimens.gap32, vertical: BDimens.gap10),
                  child: Text("特征信息",
                      style: TextStyle(
                          fontSize: BDimens.sp26,
                          color: BColors.pinnedTextColor)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
                  child: Column(
                    children: [
                      XSelectorTextField<DateTime>(
                        label: Text("入店时间"),
                        hintText: "请选择入店时间",
                        initialValue: _.target.enterTime,
                        onValueChange: (DateTime date) {
                          _.target.enterTime = date;
                        },
                        onStringify: (DateTime date) {
                          return CommonKit.formatDateTime(
                            date,
                          );
                        },
                        onFuture: () => showDatePicker(
                            context: context,
                            lastDate: DateTime.now(),
                            firstDate: DateTime(1970),
                            initialDate: _.target.enterTime ?? DateTime.now()),
                      ),
                      XSelectorTextField<AddressModel>(
                          label: Text("区域地址"),
                          onValueChange: (AddressModel result) {
                            _.target.address.address = result;
                          },
                          initialValue: _.target.address?.address,
                          onStringify: (AddressModel result) =>
                              result?.toString(),
                          onFuture: () => showXCityPicker(context,
                              addressResult: _.target.address?.address)),
                      XLabelTextField(
                        label: "详细地址",
                        key: ValueKey(_.target.address.detailAddress),
                        initialValue: _.target.address.detailAddress,
                        onChanged: (String str) {
                          _.target.wx = str;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: XSubmitButton(
        child: Text("保存并添加"),
        onFuture: controller.edit,
        onSuccess: controller.confirm,
      ),
    );
  }
}
