/*
 * @Description: 是否需要上门测量选择器
 * @Author: iamsmiling
 * @Date: 2021-05-14 18:01:07
 * @LastEditTime: 2021-06-03 16:09:59
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class OrderMeasurementNeedSwitchBar extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  OrderMeasurementNeedSwitchBar({
    Key? key,
    this.initialValue = true,
    required this.onChanged,
  }) : super(key: key);

  @override
  _OrderMeasurementNeedSwitchBarState createState() =>
      _OrderMeasurementNeedSwitchBarState();
}

class _OrderMeasurementNeedSwitchBarState
    extends State<OrderMeasurementNeedSwitchBar> {
  bool value = true;

  _onChanged(bool flag) {
    setState(() {
      value = flag;
      widget.onChanged(flag);
    });
  }

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: R.dimen.dp18),
        child: Row(
          children: [
            Expanded(
              child: Text.rich(TextSpan(
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
            ),
            Container(
                margin:
                    EdgeInsets.only(right: R.dimen.dp3, bottom: R.dimen.dp6),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: R.dimen.dp10),
                      child: Text(
                        "${value ? '需要' : '不需要'}",
                        style: TextStyle(
                            fontSize: R.dimen.sp14, color: R.color.ff181818),
                      ),
                    ),
                    SizedBox(
                        width: R.dimen.dp48,
                        height: R.dimen.dp28,
                        child: CupertinoSwitch(
                            activeColor: R.color.ffee9b5f,
                            value: value,
                            onChanged: _onChanged)),
                  ],
                )),
          ],
        ));
  }
}
