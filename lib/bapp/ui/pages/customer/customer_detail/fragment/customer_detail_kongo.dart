/*
 * @Description: 客户详情金刚区
 * @Author: iamsmiling
 * @Date: 2021-01-07 16:51:24
 * @LastEditTime: 2021-01-12 21:50:53
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_detail/customer_detail_controller.dart';

class CustomerDetailKongo extends StatelessWidget {
  final Color backgroundColor;
  const CustomerDetailKongo({Key key, this.backgroundColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerDetailController>(
      builder: (_) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: BDimens.gap32, vertical: BDimens.gap32),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x1F000000),
                  spreadRadius: 1.0,
                  blurRadius: 1,
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (CustomerDetailKongoModel e in _.kongoList)
                GestureDetector(
                  onTap: e.onTap,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                            padding:
                                EdgeInsets.symmetric(vertical: BDimens.gap20),
                            child: Image.asset(e.image)),
                        Container(
                            margin: EdgeInsets.only(bottom: BDimens.gap16),
                            child: Text(e.description)),
                      ],
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
