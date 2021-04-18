import 'package:flutter/material.dart';
import 'package:taoju5_c/component/checkbox/c_round_checked_box.dart';
import 'package:taoju5_c/domain/entity/address/address_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/capp_routes.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_list/address_list_controller.dart';

class AddressCard extends StatelessWidget {
  final AddressEntity address;
  const AddressCard({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressListController>(builder: (_) {
      return GestureDetector(
        onTap: () => Get.toNamed(AppRoutes.mine + AppRoutes.addressEdit,
            arguments: address),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: R.dimen.dp20, horizontal: R.dimen.dp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: R.dimen.dp12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      address.receiverName,
                      style: TextStyle(
                          fontSize: R.dimen.sp13, fontWeight: FontWeight.w700),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: R.dimen.dp10),
                        child: Text(
                          address.telephone,
                          style: TextStyle(
                              fontSize: R.dimen.sp13,
                              color: R.color.greyTextColor),
                        )),
                    Spacer(),
                    Text(
                      "编辑",
                      style: TextStyle(
                          fontSize: R.dimen.sp12, color: R.color.greyTextColor),
                    ),
                    Icon(R.icon.next)
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "",
                      style: TextStyle(backgroundColor: R.color.transparent),
                      children: [
                        WidgetSpan(
                          child: Visibility(
                            visible: address.isDefault,
                            child: Container(
                              margin: EdgeInsets.only(right: R.dimen.dp3),
                              decoration: BoxDecoration(
                                color: R.color.primaryColor.withOpacity(.08),
                                // borderRadius: BorderRadius.circular(2)
                              ),
                              padding:
                                  EdgeInsets.symmetric(horizontal: R.dimen.dp3),
                              child: Text(
                                "默认",
                                style: TextStyle(
                                    fontSize: R.dimen.sp13,
                                    color: R.color.primaryColor),
                              ),
                            ),
                          ),
                        ),
                        TextSpan(
                            text: address.description,
                            style: TextStyle(
                                backgroundColor: R.color.transparent,
                                color: R.color.primaryTextColor,
                                fontSize: R.dimen.sp13))
                      ],
                    ),
                    // WidgetSpan(
                    //   child: DecoratedBox(
                    //     child: Text(
                    //       "默认",
                    //       softWrap: false,
                    //       style: TextStyle(
                    //           fontSize: R.dimen.sp13, color: R.color.primaryColor),
                    //     ),
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(R.dimen.sp2),
                    //         color: R.color.primaryColor.withOpacity(.08)),
                    //   ),
                    // ),
                    // WidgetSpan(
                    //   child: Text(
                    //     address.description,
                    //     softWrap: true,
                    //     maxLines: 3,
                    //     style: TextStyle(fontSize: R.dimen.sp13),
                    //   ),
                    // ),
                  ],
                ),
                softWrap: true,
                maxLines: 3,
                textAlign: TextAlign.start,
              ),
              Container(
                margin: EdgeInsets.only(top: R.dimen.dp15),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: R.dimen.dp5),
                      child: RoundCheckbox(
                          key: ValueKey(address.isDefault),
                          value: address.isDefault,
                          onChanged: (bool flag) =>
                              _.setDefaultAddress(flag, address)),
                    ),
                    Text(
                      "设为默认地址",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: R.color.primaryColor,
                          fontSize: R.dimen.sp13),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () => _.delAddress(address),
                        child: Text(
                          "删除",
                          style: TextStyle(fontSize: R.dimen.sp13),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
