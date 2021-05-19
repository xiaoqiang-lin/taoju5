/*
 * @Description: 是否需要上门测量选择器
 * @Author: iamsmiling
 * @Date: 2021-05-14 18:01:07
 * @LastEditTime: 2021-05-14 18:27:47
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class OrderMeasurementNeedSwitchBar extends StatefulWidget {
  OrderMeasurementNeedSwitchBar({Key? key}) : super(key: key);

  @override
  _OrderMeasurementNeedSwitchBarState createState() =>
      _OrderMeasurementNeedSwitchBarState();
}

class _OrderMeasurementNeedSwitchBarState
    extends State<OrderMeasurementNeedSwitchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: R.dimen.dp18),
        child: Row(
          children: [
            Text.rich(TextSpan(
                text: "是否需要上门测装\n",
                style: TextStyle(
                    fontSize: R.dimen.sp14,
                    color: R.color.ff181818,
                    fontWeight: FontWeight.w500),
                children: [
                  WidgetSpan(
                      child: Container(
                    margin: EdgeInsets.only(top: R.dimen.dp5),
                    child: Row(
                      children: [
                        Text("注:平台会以测装后尺寸定制生产 详见",
                            style: TextStyle(
                                fontSize: R.dimen.sp11,
                                color: R.color.ff999999)),
                        Text("《服务细则》",
                            style: TextStyle(
                                fontSize: R.dimen.sp11,
                                color: R.color.ffff5005))
                      ],
                    ),
                  )),
                ])),
            Spacer(),
            Container(
                margin: EdgeInsets.only(right: R.dimen.dp3),
                child: Text(
                  "需要",
                  style: TextStyle(
                      fontSize: R.dimen.sp14, color: R.color.ff181818),
                )),
            CupertinoSwitch(value: false, onChanged: (_) {}),
          ],
        ));
  }
}
