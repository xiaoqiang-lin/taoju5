/*
 * @Description: 填写收货地址页面
 * @Author: iamsmiling
 * @Date: 2020-12-22 11:19:05
 * @LastEditTime: 2021-01-22 16:35:39
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_address_edit/customer_address_edit_controller.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/city_picker/x_city_picker.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_check_button.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_submit_button.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_label_text_field.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_selector_text_field.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerAddressEditPage extends GetView<CustomerAddressEditController> {
  const CustomerAddressEditPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BColors.primaryColor,
      appBar: AppBar(
        title: Text("填写服务地址"),
      ),
      body: GetBuilder<CustomerAddressEditController>(builder: (_) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
            child: Column(
              children: [
                XLabelTextField(
                  label: "联系人:",
                  hintText: "请填写联系人的姓名",
                  initialValue: _.customer?.name,
                  onChanged: (String text) {
                    _.customer?.name = text;
                  },
                ),
                GetBuilder<CustomerAddressEditController>(
                  id: "gender",
                  builder: (_) {
                    return Container(
                      margin: EdgeInsets.only(left: 108.w),
                      padding: EdgeInsets.symmetric(vertical: BDimens.gap24),
                      child: Stack(
                        children: [
                          TextField(readOnly: true),
                          Container(
                            child: Row(
                              key: ValueKey(_.customer?.gender ?? "gender"),
                              children: [
                                for (CustomerGenderOptionModel e
                                    in _.genderOptions)
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: BDimens.gap32),
                                    child: XCheckButton(
                                        isChecked: e.isChecked,
                                        onPresss: () => _.selectGender(e),
                                        child: Text(e.name)),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                XLabelTextField(
                  key: ValueKey(_.customer?.tel ?? "tel"),
                  label: "手机号:",
                  hintText: "请填写联系人的手机号",
                  initialValue: _.customer?.tel,
                  onChanged: (String text) {
                    _.customer?.tel = text;
                  },
                ),
                XSelectorTextField<AddressModel>(
                    key: ValueKey(_.customer?.address?.address ?? "area"),
                    label: Text("区域地址:"),
                    onValueChange: (AddressModel result) {
                      _.customer?.address?.address = result;
                    },
                    hintText: "请选择服务地址",
                    initialValue: _.customer?.address?.address,
                    onFuture: () => showXCityPicker(context,
                        addressResult: _.customer?.address?.address)),
                XLabelTextField(
                  key: ValueKey(
                      _.customer?.address?.detailAddress ?? "detailAddress"),
                  label: "门牌号:",
                  hintText: "例：5号楼203室",
                  initialValue: _.customer?.address?.detailAddress,
                  onChanged: (String text) {
                    _.customer?.address?.detailAddress = text;
                  },
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: XSubmitButton(
        child: Text("保存并使用"),
        onFuture: controller.submit,
        showLoading: !controller.isFromShare,
        onSuccess: Get.back,
      ),
    );
  }
}
