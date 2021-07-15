/*
 * @Description: 物流节点UI
 * @Author: iamsmiling
 * @Date: 2021-05-25 16:31:59
 * @LastEditTime: 2021-07-01 16:12:51
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/logistics/package_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/utils/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class LogisticsNodeCard extends StatelessWidget {
  final PackageLogisticsNodeEntity node;
  const LogisticsNodeCard({Key? key, required this.node}) : super(key: key);

  dial(String url) async {
    if (await canLaunch(url)) {
      await launch("tel:$url");
    } else {
      ToastKit.error("无法打开链接");
      throw "Could not launch $url";
    }
  }

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: node.status.isNotEmpty ? R.dimen.dp2 : 0,
                            left: node.status.isNotEmpty ? R.dimen.dp8 : 0),
                        child: Text(
                          node.date,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: R.dimen.sp12,
                            color: node.highlighted
                                ? R.color.ffee9b5f
                                : R.color.ff999999,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(left: R.dimen.dp10),
                      padding: EdgeInsets.only(
                        top: R.dimen.dp5,
                        left: R.dimen.dp20,
                        bottom: R.dimen.dp20,
                      ),
                      child: Text.rich(TextSpan(children: [
                        for (String s in node.slices)
                          TextSpan(
                              recognizer: node.recognizer
                                ..onTap = node.exp.hasMatch(s)
                                    ? () {
                                        dial(s);
                                      }
                                    : null,
                              text: s,
                              style: TextStyle(
                                  fontSize: R.dimen.sp12,
                                  color: node.exp.hasMatch(s)
                                      ? R.color.ffee9b5f
                                      : R.color.ff999999)),
                      ]))),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
