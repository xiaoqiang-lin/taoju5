/*
 * @Description: 微信分享
 * @Author: iamsmiling
 * @Date: 2021-05-17 16:16:09
 * @LastEditTime: 2021-05-17 16:47:35
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class _ShareEntity {
  late String label;
  late String icon;
  _ShareEntity({required this.icon, required this.label});
}

Future openShareModal(BuildContext context) {
  List<_ShareEntity> list = [
    _ShareEntity(icon: R.image.wechat, label: "微信"),
    _ShareEntity(icon: R.image.wechatMoment, label: "朋友圈")
  ];
  return showCupertinoModalPopup(
      context: context,
      barrierColor: R.color.ff00000.withOpacity(.7),
      builder: (BuildContext context) {
        return Container(
          height: 325,
          color: R.color.transparent,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: R.dimen.dp22),
                margin: EdgeInsets.only(
                    left: R.dimen.dp20,
                    right: R.dimen.dp20,
                    bottom: R.dimen.dp20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(R.dimen.sp7),
                    color: R.color.ffffffff),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: R.dimen.dp18, bottom: R.dimen.dp16),
                        child: Text(
                          "分享至",
                          style: TextStyle(
                              fontSize: R.dimen.sp15,
                              fontWeight: FontWeight.w600),
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: R.dimen.dp72),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (_ShareEntity e in list)
                            Column(
                              children: [
                                Image.asset(e.icon),
                                Container(
                                  margin: EdgeInsets.only(top: R.dimen.dp6),
                                  child: Text(
                                    e.label,
                                    style: TextStyle(fontSize: R.dimen.sp11),
                                  ),
                                )
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Container(
                  child: Image.asset(R.image.closeModal),
                  padding: EdgeInsets.only(bottom: R.dimen.dp68),
                ),
              )
            ],
          ),
        );
      });
}
