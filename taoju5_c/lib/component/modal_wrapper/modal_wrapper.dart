/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-05-10 09:33:26
 * @LastEditTime: 2021-05-10 09:58:17
 */
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

Future<T?> showModalPopUp<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  ImageFilter? filter,
  Color barrierColor = const Color.fromRGBO(0, 0, 0, .6),
  bool barrierDismissible = true,
  bool useRootNavigator = true,
  bool? semanticsDismissible,
}) {
  return showCupertinoModalPopup<T?>(
      context: context,
      builder: builder,
      filter: filter,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      semanticsDismissible: semanticsDismissible);
}

class ModalWrapper extends StatelessWidget {
  final WidgetBuilder builder;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? height;
  const ModalWrapper(
      {Key? key, required this.builder, this.margin, this.padding, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: margin ?? EdgeInsets.only(top: R.dimen.dp48),
            height: height ?? R.dimen.height * .88,
            padding: padding,
            width: R.dimen.width,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(R.dimen.sp7),
                child: Builder(builder: builder))),
        Positioned(
            top: R.dimen.dp10,
            right: R.dimen.dp20,
            child: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Image.asset(R.image.closeModal))),
      ],
    );
  }
}
