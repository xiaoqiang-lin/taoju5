/*
 * @Description: 包裹物流信息
 * @Author: iamsmiling
 * @Date: 2021-05-25 17:58:34
 * @LastEditTime: 2021-05-25 18:05:07
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/logistics/package_entity.dart';
import 'package:taoju5_c/res/R.dart';

import 'logistics_node_card.dart';

class PackageLogisticsCard extends StatefulWidget {
  final PackageEntity package;
  PackageLogisticsCard({Key? key, required this.package}) : super(key: key);

  @override
  _PackageLogisticsCardState createState() => _PackageLogisticsCardState();
}

class _PackageLogisticsCardState extends State<PackageLogisticsCard> {
  PackageEntity get package => widget.package;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(R.dimen.dp20),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: R.dimen.dp20),
              child: Row(
                children: [
                  ChimeraImage(
                    package.productImage,
                    width: R.dimen.dp60,
                    height: R.dimen.dp60,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: R.dimen.dp10,
                          top: R.dimen.dp5,
                          bottom: R.dimen.dp5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            package.status,
                            style: TextStyle(
                                fontSize: R.dimen.sp14,
                                color: R.color.ffee9b5f,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: R.dimen.dp10),
                            child: Text(
                              package.productName,
                              style: TextStyle(
                                  fontSize: R.dimen.sp14,
                                  color: R.color.ff333333,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
          Divider(),
          Container(
              child: Stack(
            children: [
              Positioned(
                  left: R.dimen.dp22 / 2,
                  child: Container(
                    height: package.lineHeight,
                    decoration: BoxDecoration(
                        border:
                            Border(left: BorderSide(color: R.color.ffe5e5e5))),
                  )),
              Column(
                children: [
                  for (PackageLogisticsNodeEntity node in package.nodes)
                    LogisticsNodeCard(node: node)
                ],
              ),
              // ListView.builder(
              //   padding: EdgeInsets.zero,
              //   shrinkWrap: true,
              //   itemBuilder: (BuildContext context, int index) {
              //     // return Text("$index");
              //     return LogisticsNodeCard(node: package.nodes[index]);
              //   },
              //   itemCount: package.nodes.length,
              // ),
            ],
          ))
        ],
      ),
    );
  }
}
