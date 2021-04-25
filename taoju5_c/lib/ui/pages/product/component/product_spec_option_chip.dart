/*
 * @Description: 商品规格选项chip
 * @Author: iamsmiling
 * @Date: 2021-04-25 16:13:58
 * @LastEditTime: 2021-04-25 16:58:20
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/product_spec_entity.dart';
import 'package:taoju5_c/res/R.dart';

class ProductSpecOptionChip extends StatelessWidget {
  final ProductSpecOptionEntity option;
  const ProductSpecOptionChip({Key? key, required this.option})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          return R.color.ffee9b5f;
        }),
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          return BorderSide(color: R.color.ffee9b5f);
        }),
      ))),
      child: Container(),
    );
  }
}
