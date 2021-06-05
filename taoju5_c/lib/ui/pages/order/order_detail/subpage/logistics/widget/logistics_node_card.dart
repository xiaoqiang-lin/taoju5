/*
 * @Description: 物流节点UI
 * @Author: iamsmiling
 * @Date: 2021-05-25 16:31:59
 * @LastEditTime: 2021-05-28 17:57:11
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/logistics/package_entity.dart';
import 'package:taoju5_c/res/R.dart';

class LogisticsNodeCard extends StatelessWidget {
  final PackageLogisticsNodeEntity node;
  const LogisticsNodeCard({Key? key, required this.node}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        node.renderBox = context.findRenderObject() as RenderBox;
      });
      return Container(
        // padding: EdgeInsets.only(left: R.dimen.dp10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        child: node.icon,
                        margin: EdgeInsets.only(right: R.dimen.dp10),
                      ),
                      Text(
                        node.status,
                        style: TextStyle(
                            color: node.highlighted
                                ? R.color.ffee9b5f
                                : R.color.ff999999,
                            fontSize: R.dimen.sp14,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: node.status.isNotEmpty ? R.dimen.dp8 : 0),
                        child: Text(
                          node.date,
                          style: TextStyle(
                            fontSize: R.dimen.sp12,
                            color: node.highlighted
                                ? R.color.ffee9b5f
                                : R.color.ff999999,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(left: R.dimen.dp10),
                      // decoration: BoxDecoration(
                      //     border:
                      //         Border(left: BorderSide(color: R.color.ffe5e5e5))),
                      padding: EdgeInsets.only(
                        top: R.dimen.dp5,
                        left: R.dimen.dp20,
                        bottom: R.dimen.dp20,
                      ),
                      child: Text.rich(TextSpan(
                          text: "",
                          style: TextStyle(
                              fontSize: R.dimen.sp12, color: R.color.ff999999),
                          children: [
                            for (String s in node.slices)
                              WidgetSpan(
                                  child: GestureDetector(
                                // onTap: node.exp.hasMatch(s)
                                //     ? () => _.dial("tel:$s")
                                //     : null,
                                child: Text(s,
                                    style: TextStyle(
                                        fontSize: R.dimen.sp12,
                                        color: node.exp.hasMatch(s)
                                            ? R.color.ffee9b5f
                                            : R.color.ff999999)),
                              ))
                          ])))
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
