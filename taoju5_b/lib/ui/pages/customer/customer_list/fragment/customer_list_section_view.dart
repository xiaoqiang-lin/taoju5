import 'package:flutter/material.dart';

import 'package:azlistview/azlistview.dart';
import 'package:taoju5_b/domain/model/customer/customer_model.dart';

import 'package:get/get.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';

class CustomerListSectionView extends StatelessWidget {
  final List<CustomerModel> customerList;
  final Function(CustomerModel e) onItemTap;
  const CustomerListSectionView(
      {Key key, @required this.customerList, this.onItemTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AzListView(
        data: customerList,
        itemCount: customerList.length,
        indexBarData: customerList.map((e) => e.tag).toSet().toList(),
        susItemBuilder: (BuildContext context, int i) {
          String tag = customerList[i].tag;
          String lastTag = i == 0 ? "#" : customerList[i - 1].tag;
          return Visibility(
            child: Container(
              color: Get.theme.scaffoldBackgroundColor,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                  horizontal: BDimens.gap32, vertical: BDimens.gap4),
              child: Text(
                "$tag",
                textAlign: TextAlign.start,
              ),
            ),
            visible: i == 0 ? true : tag != lastTag,
          );
        },
        itemBuilder: (BuildContext context, int i) {
          return GestureDetector(
            onTap: () {
              onItemTap(customerList[i]);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: BDimens.gap16),
              decoration: BoxDecoration(
                  color: BColors.primaryColor,
                  border: Border(
                      bottom:
                          BorderSide(width: .8, color: BColors.dividerColor))),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                  horizontal: BDimens.gap32, vertical: BDimens.gap24),
              child: Text("${customerList[i].name}"),
            ),
          );
        });
  }
}
