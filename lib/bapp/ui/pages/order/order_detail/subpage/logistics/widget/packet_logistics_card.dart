import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/order/order_logistics_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/logistics/widget/packet_logistics_station_card.dart';
import 'dart:math' as math;
import 'package:taoju5/bapp/ui/widgets/base/x_expansion_panel.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_copy_button.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class PacketLogisticsCard extends StatefulWidget {
  final PacketLogisticsModel packet;
  PacketLogisticsCard({Key key, @required this.packet}) : super(key: key);

  @override
  _PacketLogisticsCardState createState() => _PacketLogisticsCardState();
}

class _PacketLogisticsCardState extends State<PacketLogisticsCard> {
  PacketLogisticsModel get packet => widget.packet;

  bool get isOpen => visibleCount == packet.stationList.length;

  int visibleCount = 3;

  List<PacketStationModel> get hiddenStationList =>
      packet.stationList.sublist(visibleCount);

  @override
  void initState() {
    visibleCount = math.min(packet.stationList.length, 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: BDimens.gap16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                packet.name,
                style: TextStyle(
                    fontSize: BDimens.sp32, fontWeight: FontWeight.w500),
              ),
              Text(
                packet.status,
                style: TextStyle(
                    color: BColors.pinkColor,
                    fontSize: BDimens.sp32,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: BDimens.gap24),
              child: Divider()),
          Container(
            alignment: Alignment.centerLeft,
            height: 172.h,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: packet.imageList.length,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                      height: 96.h,
                      margin: EdgeInsets.only(right: BDimens.gap16),
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: XPhotoViewer(url: packet.imageList[i])));
                }),
          ),
          Visibility(
            visible: !GetUtils.isNullOrBlank(packet.stationList),
            child: Container(
                margin: EdgeInsets.symmetric(vertical: BDimens.gap8),
                child: Text(
                  "快递公司:${packet.company}",
                  style: TextStyle(fontSize: BDimens.sp28),
                )),
          ),
          Visibility(
            visible: !GetUtils.isNullOrBlank(packet.stationList),
            child: Container(
                margin: EdgeInsets.symmetric(vertical: BDimens.gap8),
                child: Row(
                  children: [
                    Text(
                      "快递单号:${packet.no}",
                      style: TextStyle(fontSize: BDimens.sp28),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: BDimens.gap12),
                        child: XCopyButton(content: packet.no))
                  ],
                )),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: BDimens.gap8),
            child: Text(
              "共${packet.imageList.length}件",
              style: TextStyle(
                  fontSize: BDimens.sp26, color: BColors.tipTextColor),
            ),
          ),
          Visibility(
            visible: !GetUtils.isNullOrBlank(packet.stationList),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: BDimens.gap8),
              child: Text(
                "快递信息:",
                style: TextStyle(
                    fontSize: BDimens.sp32, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Visibility(
            visible: !GetUtils.isNullOrBlank(packet.stationList),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int i) {
                return PacketLogisticsStationCard(
                    station: packet.stationList[i],
                    visibleCount: visibleCount,
                    stationList: packet.stationList);
              },
              itemCount: visibleCount,
            ),
          ),
          Visibility(
              visible: !isOpen,
              child: XExpansionPanel(
                  title: Visibility(
                    visible: !isOpen,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          visibleCount = packet.stationList.length;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: BColors.actionChipBorderColor),
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.only(left: 64),
                        // backgroundColor: Get.theme.primaryColor,
                        child: Text(
                          "更多快递信息",
                          style: TextStyle(
                              color: BColors.tipColor, fontSize: BDimens.sp24),
                        ),
                      ),
                    ),
                  ),
                  children: [
                    for (PacketStationModel item in hiddenStationList)
                      PacketLogisticsStationCard(
                          visibleCount: hiddenStationList.length,
                          station: item,
                          stationList: hiddenStationList),
                  ])),
          Visibility(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  visibleCount = 3;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                    border: Border.all(color: BColors.actionChipBorderColor),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(left: 64),
                // backgroundColor: Get.theme.primaryColor,
                child: Text(
                  "收起",
                  style: TextStyle(
                      fontSize: BDimens.sp24, color: BColors.tipColor),
                ),
              ),
            ),
            visible: isOpen,
          )
        ],
      ),
    );
  }
}
