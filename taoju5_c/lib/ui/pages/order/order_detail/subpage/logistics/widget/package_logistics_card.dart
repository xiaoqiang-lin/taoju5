/*
 * @Description: 包裹物流信息
 * @Author: iamsmiling
 * @Date: 2021-05-25 17:58:34
 * @LastEditTime: 2021-06-21 13:33:38
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taoju5_c/component/button/rotate_button.dart';
import 'package:taoju5_c/component/expansion_tile/collpase_tile.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/logistics/package_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/utils/toast.dart';

import 'logistics_node_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class PackageLogisticsCard extends StatefulWidget {
  final PackageEntity package;

  PackageLogisticsCard({Key? key, required this.package}) : super(key: key);

  @override
  _PackageLogisticsCardState createState() => _PackageLogisticsCardState();
}

class _PackageLogisticsCardState extends State<PackageLogisticsCard> {
  PackageEntity get package => widget.package;

  late Completer completer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  dial(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ToastKit.error("无法打开链接");
      throw "Could not launch $url";
    }
  }

  copy(String data) {
    Clipboard.setData(ClipboardData(text: data));
    // ToastKit.success(successTip);
    Get.snackbar("", "",
        duration: Duration(milliseconds: 1500),
        messageText: Text("复制成功"),
        backgroundColor: Colors.black.withOpacity(.5));
  }

  Future open() {
    completer = Completer();
    setState(() {
      package.expand = true;
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
    return completer.future;
  }

  Future close() {
    setState(() {
      package.expand = false;
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    print("执行build---${package.lineHeight}");
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(
                  top: R.dimen.dp15,
                  bottom: R.dimen.dp13,
                  left: R.dimen.dp24,
                  right: R.dimen.dp20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    package.productName,
                    style: TextStyle(
                        fontSize: R.dimen.sp14,
                        color: R.color.ff333333,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    package.status,
                    style: TextStyle(
                        fontSize: R.dimen.sp14,
                        color: R.color.ffee9b5f,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )),
          Container(
            width: R.dimen.width,
            padding: EdgeInsets.only(
                left: R.dimen.dp24, top: R.dimen.dp5, bottom: R.dimen.dp5),
            decoration: BoxDecoration(color: R.color.ffee9b5f.withOpacity(.15)),
            child: Text(
              "此包裹包含${package.products.length}个商品",
              style: TextStyle(fontSize: R.dimen.sp12, color: R.color.ff333333),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: R.dimen.dp20, top: R.dimen.dp15),
            height: R.dimen.dp120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: package.products.length,
                itemBuilder: (BuildContext context, int i) {
                  PackageProductEntity product = package.products[i];
                  return Container(
                    margin: EdgeInsets.only(right: R.dimen.dp15),
                    child: Column(
                      children: [
                        ChimeraImage(
                          product.image,
                          width: R.dimen.dp80,
                          height: R.dimen.dp80,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: R.dimen.dp8),
                          child: Text(
                            product.name,
                            style: TextStyle(
                                fontSize: R.dimen.sp12,
                                color: R.color.ff333333),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Divider(indent: R.dimen.dp20, endIndent: R.dimen.dp20),
          Container(
            margin: EdgeInsets.only(
                left: R.dimen.dp20, top: R.dimen.dp20, right: R.dimen.dp20),
            child: Row(
              children: [
                Container(
                  width: R.dimen.dp22,
                  height: R.dimen.dp22,
                  margin: EdgeInsets.only(right: R.dimen.dp10),
                  decoration: BoxDecoration(
                      color: R.color.ff979797,
                      borderRadius: BorderRadius.circular(R.dimen.dp22 / 2)),
                ),
                Text(
                  "${package.company} ${package.orderNo}",
                  style: TextStyle(
                      color: R.color.ff333333, fontSize: R.dimen.sp12),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => copy(package.orderNo),
                  child: Text(
                    "复制",
                    style: TextStyle(
                        color: R.color.ff999999, fontSize: R.dimen.sp12),
                  ),
                ),
                Text(
                  "  |  ",
                  style: TextStyle(
                      color: R.color.ff999999, fontSize: R.dimen.sp12),
                ),
                GestureDetector(
                  onTap: () => dial(package.telephone),
                  child: Text(
                    "联系快递",
                    style: TextStyle(
                        color: R.color.ff999999, fontSize: R.dimen.sp12),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(R.dimen.dp20),
              child: Stack(
                children: [
                  Positioned(
                      left: R.dimen.dp22 / 2,
                      child: Container(
                        height: package.lineHeight,
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(color: R.color.ffe5e5e5))),
                      )),
                  Column(
                    children: [
                      for (PackageLogisticsNodeEntity node in package.nodes)
                        LogisticsNodeCard(node: node)
                    ],
                  ),
                ],
              )),
          Visibility(
            visible: package.canExpand && !package.expand,
            child: Container(
              transform: Matrix4.translationValues(0, -R.dimen.dp10, 0),
              margin: EdgeInsets.only(left: R.dimen.dp50, bottom: R.dimen.dp20),
              padding: EdgeInsets.symmetric(
                  horizontal: R.dimen.dp10, vertical: R.dimen.dp6),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: R.color.ff999999,
                  ),
                  borderRadius: BorderRadius.circular(R.dimen.sp15)),
              child: RotateButton(
                onPressed: open,
                label: Container(
                  margin: EdgeInsets.only(right: R.dimen.dp5),
                  child: Text(
                    "更多物流信息",
                    style: TextStyle(
                        fontSize: R.dimen.sp12, color: R.color.ff999999),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              visible: package.expand,
              child: Container(
                transform: Matrix4.translationValues(0, -R.dimen.dp10, 0),
                margin:
                    EdgeInsets.only(left: R.dimen.dp50, bottom: R.dimen.dp20),
                padding: EdgeInsets.symmetric(
                    horizontal: R.dimen.dp10, vertical: R.dimen.dp6),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: R.color.ff999999,
                    ),
                    borderRadius: BorderRadius.circular(R.dimen.sp15)),
                child: RotateButton(
                  collapse: false,
                  onPressed: close,
                  label: Container(
                    margin: EdgeInsets.only(right: R.dimen.dp5),
                    child: Text(
                      "收起",
                      style: TextStyle(
                          fontSize: R.dimen.sp12, color: R.color.ff999999),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
