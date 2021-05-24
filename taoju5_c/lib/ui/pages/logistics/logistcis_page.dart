/*
 * @Description: 物流页面
 * @Author: iamsmiling
 * @Date: 2021-05-20 14:22:40
 * @LastEditTime: 2021-05-21 17:56:02
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/logistics/package_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/logistics/logistics_controller.dart';
import 'package:taoju5_c/ui/pages/logistics/logistics_time_line.dart';

class LogisticsPage extends GetView<LogisticsController> {
  const LogisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("查看物流"),
      ),
      body: FutureLoadStateBuilder(
          controller: controller,
          builder: (LogisticsController _) {
            PackageEntity item = _.packets.first;
            return Container(
              padding: EdgeInsets.all(R.dimen.dp20),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: R.dimen.dp20),
                      child: Row(
                        children: [
                          ChimeraImage(
                            imageUrl: item.productImage,
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
                                    item.status,
                                    style: TextStyle(
                                        fontSize: R.dimen.sp14,
                                        color: R.color.ffee9b5f,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: R.dimen.dp10),
                                    child: Text(
                                      item.productName,
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
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        PackageLogisticsNodeEntity node = item.nodes[index];
                        return Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Positioned(
                              left: R.dimen.dp20,
                              child: Container(
                                // alignment: Alignment.center,
                                decoration: BoxDecoration(color: Colors.black),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    node.icon,
                                    Container(
                                      width: 1,
                                      height: 30,
                                      color: R.color.ffe5e5e5,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // Visibility(
                            //   visible:
                            //       item.nodes.every((e) => e.renderBox != null),
                            //   child: LogisticsTimeLine(nodes: item.nodes),
                            // ),
                            Builder(builder: (BuildContext context) {
                              return Container(
                                margin: EdgeInsets.only(
                                    left: R.dimen.dp10,
                                    top: R.dimen.dp20,
                                    bottom: R.dimen.dp20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                node.status,
                                                style: TextStyle(
                                                    color: node.highlighted
                                                        ? R.color.ffee9b5f
                                                        : R.color.ff999999,
                                                    fontSize: R.dimen.sp14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left:
                                                        node.icon is! Container
                                                            ? R.dimen.dp8
                                                            : 0),
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
                                              margin: EdgeInsets.only(
                                                  top: R.dimen.dp5),
                                              child: Text.rich(TextSpan(
                                                  text: "",
                                                  style: TextStyle(
                                                      fontSize: R.dimen.sp12,
                                                      color: R.color.ff999999),
                                                  children: [
                                                    for (String s
                                                        in node.slices)
                                                      WidgetSpan(
                                                          child:
                                                              GestureDetector(
                                                        onTap: node.exp
                                                                .hasMatch(s)
                                                            ? () =>
                                                                _.dial("tel:$s")
                                                            : null,
                                                        child: Text(s,
                                                            style: TextStyle(
                                                                fontSize: R
                                                                    .dimen.sp12,
                                                                color: node.exp
                                                                        .hasMatch(
                                                                            s)
                                                                    ? R.color
                                                                        .ffee9b5f
                                                                    : R.color
                                                                        .ff999999)),
                                                      ))
                                                  ])))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                          ],
                        );
                        // return Container(
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: R.color.ffe5e5e5)),
                        //   margin: EdgeInsets.symmetric(vertical: R.dimen.dp20),
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Builder(builder: (BuildContext context) {
                        // WidgetsBinding.instance!
                        //     .addPostFrameCallback((timeStamp) {
                        //   RenderBox? renderObject =
                        //       context.findRenderObject() as RenderBox?;
                        //   print("哈哈哈哈哈");
                        //   if (renderObject != null) {
                        //     Rect rect = renderObject.paintBounds;
                        //     node.height = rect.height;

                        //     Offset offset =
                        //         renderObject.localToGlobal(Offset.zero);
                        //     print(rect.size);
                        //     // print(rect.center);
                        //     print(node.height);
                        //     print(offset);
                        //   }
                        //   // print(node.height);
                        // });
                        //         return Container(
                        //           child: node.isBig
                        //               ? Image.asset(R.image.checked,
                        //                   color: node.highlighted
                        //                       ? null
                        //                       : R.color.ffe5e5e5)
                        //               : Container(
                        //                   margin: EdgeInsets.only(
                        //                       left: R.dimen.dp4),
                        //                   width: R.dimen.dp10,
                        //                   height: R.dimen.dp10,
                        //                   decoration: BoxDecoration(
                        //                       color: R.color.ffe5e5e5,
                        //                       borderRadius:
                        //                           BorderRadius.circular(
                        //                               R.dimen.dp10 / 2)),
                        //                 ),
                        //         );
                        //       }),
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(left: R.dimen.dp10),
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               Row(
                        //                 children: [
                        //                   Text(
                        //                     node.status,
                        //                     style: TextStyle(
                        //                         color: node.highlighted
                        //                             ? R.color.ffee9b5f
                        //                             : R.color.ff999999,
                        //                         fontSize: R.dimen.sp14,
                        //                         fontWeight: FontWeight.bold),
                        //                   ),
                        //                   Container(
                        //                     margin: EdgeInsets.only(
                        //                         left: node.isBig
                        //                             ? R.dimen.dp8
                        //                             : 0),
                        //                     child: Text(
                        //                       node.date,
                        //                       style: TextStyle(
                        //                         fontSize: R.dimen.sp12,
                        //                         color: node.highlighted
                        //                             ? R.color.ffee9b5f
                        //                             : R.color.ff999999,
                        //                       ),
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //               Container(
                        //                   margin:
                        //                       EdgeInsets.only(top: R.dimen.dp5),
                        //                   child: Text.rich(TextSpan(
                        //                       text: "",
                        //                       style: TextStyle(
                        //                           fontSize: R.dimen.sp12,
                        //                           color: R.color.ff999999),
                        //                       children: [
                        //                         for (String s in node.slices)
                        //                           WidgetSpan(
                        //                               child: GestureDetector(
                        //                             onTap: node.exp.hasMatch(s)
                        //                                 ? () => _.dial("tel:$s")
                        //                                 : null,
                        //                             child: Text(s,
                        //                                 style: TextStyle(
                        //                                     fontSize:
                        //                                         R.dimen.sp12,
                        //                                     color: node.exp
                        //                                             .hasMatch(s)
                        //                                         ? R.color
                        //                                             .ffee9b5f
                        //                                         : R.color
                        //                                             .ff999999)),
                        //                           ))
                        //                       ])))
                        //             ],
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // );
                      },
                      itemCount: item.nodes.length,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
