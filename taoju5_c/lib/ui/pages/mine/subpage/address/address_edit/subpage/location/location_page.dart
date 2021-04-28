/*
 * @Description: 定位
 * @Author: iamsmiling
 * @Date: 2021-04-28 16:51:54
 * @LastEditTime: 2021-04-28 17:38:42
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/textfield/clearable_text_field.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_edit/subpage/location/location_controller.dart';
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
                    child: Row(
                      children: [
                        Text("杭州"),
                        Expanded(
                          child: ClearableTextField(
                              decoration: InputDecoration(
                                  fillColor: R.color.fff5f5f5,
                                  hintText: "请输入您的收货地址")),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        width: R.dimen.width,
                        child: BMFMapWidget(
                          // onBMFMapCreated: (controller) {
                          //   onBMFMapCreated(controller);
                          // },
                          mapOptions: _.mapOptions,
                          onBMFMapCreated: (BMFMapController controller) {},
                        )),
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: R.dimen.width,
                    height: R.dimen.height * .5,
                    color: Colors.red,
                  ))
            ],
          );
        },
      ),
    );
  }
}
