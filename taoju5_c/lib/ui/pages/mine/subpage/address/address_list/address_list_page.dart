/*
 * @Description: 地址列表页
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-28 09:07:19
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_list/address_list_controller.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/wdiget/addresss_card.dart';

class AddressListPage extends GetView<AddressListController> {
  const AddressListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("地址管理"),
      ),
      body: FutureLoadStateBuilder<AddressListController>(
        controller: controller,
        builder: (_) {
          return ListView.separated(
              itemBuilder: (BuildContext context, int i) {
                return AddressCard(address: _.addresses[i]);
              },
              separatorBuilder: (BuildContext context, int i) =>
                  Divider(indent: R.dimen.dp24, endIndent: R.dimen.dp24),
              itemCount: _.addresses.length);
        },
      ),
      bottomNavigationBar: Container(
        width: Get.width,
        height: kBottomNavigationBarHeight,
        margin: EdgeInsets.only(
            top: R.dimen.dp8,
            left: R.dimen.dp20,
            right: R.dimen.dp20,
            bottom: R.dimen.dp20),
        child: PrimaryButton(
          onPressed: () => Get.toNamed(AppRoutes.mine + AppRoutes.addressEdit),
          text: "+ 新增收货地址",
        ),
      ),
    );
  }
}