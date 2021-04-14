import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/res/R.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/address/address_controller.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/address/wdiget/addresss_card.dart';

class CAddressPage extends StatelessWidget {
  const CAddressPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CAddressController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("地址管理"),
          ),
          body: ListView.separated(
              itemBuilder: (BuildContext context, int i) {
                return CAddressCard(address: _.addresses[i]);
              },
              separatorBuilder: (BuildContext context, int i) =>
                  Divider(indent: R.dimen.dp24, endIndent: R.dimen.dp24),
              itemCount: _.addresses.length),
        );
      },
    );
  }
}
