import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/order/order_logistics_model.dart';
import 'package:get/utils.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

class PacketLogisticsStationCard extends StatefulWidget {
  final PacketStationModel station;
  final List<PacketStationModel> stationList;
  final int visibleCount;
  const PacketLogisticsStationCard(
      {Key key,
      @required this.station,
      @required this.stationList,
      @required this.visibleCount})
      : super(key: key);

  @override
  _PacketLogisticsStationCardState createState() =>
      _PacketLogisticsStationCardState();
}

class _PacketLogisticsStationCardState
    extends State<PacketLogisticsStationCard> {
  PacketStationModel get station => widget.station;
  List<PacketStationModel> get stationList => widget.stationList;
  double mHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      RenderObject renderObject = context.findRenderObject();
      setState(() {
        mHeight = (renderObject.semanticBounds.size.height) / 2;
      });
    });
  }

  TextStyle _activeTextStyle =
      TextStyle(color: BColors.textColor, fontSize: BDimens.sp28);

  TextStyle _deactiveTextStyle =
      TextStyle(color: BColors.tipTextColor, fontSize: BDimens.sp28);

  TextStyle get _stationTextStyle =>
      station == stationList.first ? _activeTextStyle : _deactiveTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(station.arriveAtDate ?? "-.--", style: _stationTextStyle),
                Text(station.arriveAtTime ?? "-.--",
                    style: _stationTextStyle.copyWith(fontSize: BDimens.sp24)),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 1,
                  height: mHeight,
                  color: station == stationList?.first
                      ? Colors.transparent
                      : BColors.timeLineColor,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: station == stationList?.first
                          ? BColors.timePointColor
                          : Colors.white,
                      border: Border.all(
                        color: station == stationList?.first
                            ? Colors.transparent
                            : BColors.timeLineColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                Container(
                  width: 1,
                  height: mHeight,
                  color: station == stationList[widget.visibleCount - 1]
                      ? Colors.transparent
                      : BColors.timeLineColor,
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                    visible: !GetUtils.isNullOrBlank(station.description),
                    child: Text(
                      station.description,
                      style: _stationTextStyle,
                    )),
                Visibility(
                    visible: !GetUtils.isNullOrBlank(station.name),
                    child: Text(station.name,
                        style:
                            _stationTextStyle.copyWith(fontSize: BDimens.sp24)))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
