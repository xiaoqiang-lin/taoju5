/*
 * @Description: 定位
 * @Author: iamsmiling
 * @Date: 2021-04-28 16:51:54
 * @LastEditTime: 2021-04-29 14:29:17
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/textfield/clearable_text_field.dart';
import 'package:taoju5_c/domain/entity/address/poi_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_edit/subpage/location/location_controller.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("获取定位"),
      ),
      body: GetBuilder<LocationController>(
        builder: (_) {
          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: R.dimen.dp24, right: R.dimen.dp20),
                    padding: EdgeInsets.symmetric(vertical: R.dimen.dp8),
                    child: Row(
                      children: [
                        Text(
                          "杭州",
                          style: TextStyle(fontSize: R.dimen.sp14),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: R.dimen.dp7),
                          child: Image.asset(R.image.dropdown),
                        ),
                        Expanded(
                          child: Container(
                            constraints:
                                BoxConstraints(maxHeight: R.dimen.dp30),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(R.dimen.sp30),
                                color: R.color.fff5f5f5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: R.dimen.dp15, right: R.dimen.dp3),
                                  child: Image.asset(R.image.locationSearch),
                                ),
                                Expanded(
                                  child: ClearableTextField(
                                      decoration: InputDecoration(
                                          fillColor: R.color.fff5f5f5,
                                          hintText: "请输入您的收货地址",
                                          // isCollapsed: true,
                                          isDense: true,
                                          hintStyle: TextStyle(
                                              fontSize: R.dimen.sp10,
                                              color: R.color.ffb4b4b4),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        width: R.dimen.width,
                        height: R.dimen.height * 2,
                        child: BMFMapWidget(
                          // onBMFMapCreated: (controller) {
                          //   onBMFMapCreated(controller);
                          // },
                          mapOptions: _.mapOptions,
                          onBMFMapCreated: _.onBMFMapCreated,
                        )),
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: R.dimen.width,
                    height: R.dimen.height * .5,
                    color: R.color.ffffffff,
                    child: ListView.separated(
                      itemCount: _.pois.length,
                      itemBuilder: (BuildContext context, int i) {
                        POIEntity item = _.pois[i];
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: R.dimen.dp20, vertical: R.dimen.dp14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(fontSize: R.dimen.sp14),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: R.dimen.dp7),
                                  child: Text(
                                    item.address,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: R.dimen.sp12,
                                        color: R.color.ff999999),
                                  ))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int i) {
                        return Divider(
                          indent: R.dimen.dp20,
                          endIndent: R.dimen.dp20,
                        );
                      },
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
