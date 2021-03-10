/*
 * @Description:SubmitStatus提交状态
 * @Author: iamsmiling
 * @Date: 2021-01-22 13:54:59
 * @LastEditTime: 2021-02-10 10:54:51
 */

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:taoju5/type_defs/type_defs.dart';

enum SubmitStatus { loading, success, failure }

class XTickController extends GetxController {
  SubmitStatus status;
  final FutureCallback onFuture;
  final Function onSuccess;
  final Function onError;
  final Function onComplete;
  final String successTip;
  final String errorTip;

  XTickController(
      {this.successTip = "提交成功",
      this.errorTip = "提交失败",
      this.onSuccess,
      this.onError,
      this.onComplete,
      @required this.onFuture,
      this.status = SubmitStatus.loading});

  Map<SubmitStatus, String> statusMap = {
    SubmitStatus.loading: "loading",
    SubmitStatus.failure: "failure",
    SubmitStatus.success: "success"
  };

  String get animation => statusMap[status];

  String tip = "正在提交";
  @override
  void onInit() {
    super.onInit();
    status = SubmitStatus.loading;
    tip = "正在提交";
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await onFuture().then((value) {
        status = SubmitStatus.success;
        tip = "提交成功";
      }).catchError((err) {
        status = SubmitStatus.failure;
        if (onError != null) onError();
        tip = err;
      }).whenComplete(() {
        update(["status"]);
        Future.delayed(Duration(milliseconds: 1500), () {
          update(["tip"]);
        });
        Future.delayed(Duration(milliseconds: 2400), () {
          EasyLoading.dismiss(animation: true).then((value) {
            if (status == SubmitStatus.success && onSuccess != null) {
              onSuccess();
            }
            if (status == SubmitStatus.failure && onError != null) {
              onError();
            }
            if (onComplete != null) onComplete();
          });
        });
      });
    });
  }
}

class XTikerWidget extends StatelessWidget {
  final FutureCallback onFuture;
  final Function onSuccess;
  final Function onError;
  final Function onComplete;
  const XTikerWidget(
      {Key key,
      @required this.onFuture,
      this.onSuccess,
      this.onError,
      this.onComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<XTickController>(
      init: XTickController(
          onFuture: onFuture,
          onComplete: onComplete,
          onError: onError,
          onSuccess: onSuccess),
      builder: (_) {
        return Column(
          children: [
            GetBuilder<XTickController>(
              id: "status",
              builder: (_) {
                return SizedBox(
                  width: 72,
                  height: 72,
                  child: FlareActor("assets/flrs/submit_status.flr",
                      animation: _.animation),
                );
              },
            ),
            GetBuilder<XTickController>(
              id: "tip",
              builder: (_) {
                return Container(
                  child: Text(
                    _.tip,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
