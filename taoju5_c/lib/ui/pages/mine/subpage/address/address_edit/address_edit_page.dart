/*
 * @Description: 新增地址
 * @Author: iamsmiling
 * @Date: 2021-04-15 19:49:20
 * @LastEditTime: 2021-04-19 10:25:34
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/appbar/primary_app_bar.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/checkbox/c_round_checked_box.dart';
import 'package:taoju5_c/component/textfield/fixed_label_text_field.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_edit/address_edit_controller.dart';

class AddresseEditPage extends StatelessWidget {
  const AddresseEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressEditController>(builder: (_) {
      return Scaffold(
        appBar: PrimaryAppBar(
          title: _.isNew ? "新增收货地址" : "编辑收货地址",
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                    initialValue: _.addressArg.receiverName,
                    onChanged: _.setReceiverName,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(fontSize: R.dimen.sp13),
                    decoration: InputDecoration(
                        prefixIcon: FixedLabelTextField(label: "收货人"),
                        hintText: "请输入姓名",
                        hintStyle: TextStyle(
                            fontSize: R.dimen.sp13, color: R.color.ffc7c8cc))),
                TextFormField(
                    initialValue: _.addressArg.telephone,
                    onChanged: _.setTelephone,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(fontSize: R.dimen.sp13),
                    decoration: InputDecoration(
                        prefixIcon: FixedLabelTextField(label: "手机号码"),
                        hintText: "请输入手机号",
                        hintStyle: TextStyle(
                            fontSize: R.dimen.sp13, color: R.color.ffc7c8cc))),
                TextFormField(
                    onTap: _.selectArea,
                    readOnly: true,
                    controller: _.areaController,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(fontSize: R.dimen.sp13),
                    decoration: InputDecoration(
                        prefixIcon: FixedLabelTextField(label: "选择地区"),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerRight,
                          icon: Image.asset(R.image.next),
                        ),
                        hintText: "请选择省、市、区",
                        hintStyle: TextStyle(
                            fontSize: R.dimen.sp13, color: R.color.ffc7c8cc))),
                TextFormField(
                    initialValue: _.addressArg.concreteInfo,
                    onChanged: _.setConcreteInfo,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(fontSize: R.dimen.sp13),
                    maxLines: 2,
                    decoration: InputDecoration(
                        prefixIcon: FixedLabelTextField(label: "详细地址"),
                        hintText: "请输入详细地址",
                        hintStyle: TextStyle(
                            fontSize: R.dimen.sp13, color: R.color.ffc7c8cc))),
                Container(
                    margin: EdgeInsets.only(
                        top: R.dimen.dp15, bottom: R.dimen.dp60),
                    child: Row(
                      children: [
                        GetBuilder<AddressEditController>(
                            id: "is_default",
                            builder: (_) {
                              return RoundCheckbox(
                                  value: _.isDefaultAddress,
                                  onChanged: _.setDefaultAddress);
                            }),
                        Container(
                            margin: EdgeInsets.only(left: R.dimen.dp5),
                            child: Text(
                              "设为默认地址",
                              style: TextStyle(fontSize: R.dimen.sp13),
                            )),
                        Spacer(),
                        Image.asset(R.image.locationAccent),
                        Text(
                          "获取定位",
                          style: TextStyle(
                              fontSize: R.dimen.sp12, color: R.color.ffee9b5f),
                        )
                      ],
                    )),
                PrimaryButton(
                    text: "保存",
                    size: PrimaryButtonSize.large,
                    onPressed: _.submit)
              ],
            ),
          ),
        ),
      );
    });
  }
}
