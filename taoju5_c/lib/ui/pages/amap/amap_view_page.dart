import 'package:flutter/material.dart';

// import 'package:taoju5_c/pages/amap/amap_view_controller.dart';

class AMapViewPage extends StatelessWidget {
  const AMapViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("获取定位"),
      ),
      // body: GetBuilder<AmapViewController>(
      //   builder: (_) {
      //     return UiKitView(
      //       viewType: _.viewType,
      //       creationParamsCodec: const StandardMessageCodec(),
      //     );
      //   },
      // ),
    );
  }
}
