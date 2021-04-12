import 'package:flutter/material.dart';

import 'future_loadstate_controller.dart';
import 'package:get/get.dart';

class FutureLoadStateBuilder<T extends FutureLoadStateController>
    extends StatelessWidget {
  final T futureController;
  const FutureLoadStateBuilder({Key key, this.futureController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (_) {
        return futureController.view;
      },
    );
  }
}
