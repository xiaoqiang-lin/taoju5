/*
 * @Description: 商品规格选项chip
 * @Author: iamsmiling
 * @Date: 2021-04-25 16:13:58
 * @LastEditTime: 2021-04-26 10:06:13
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
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
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize:
                MaterialStateProperty.all(Size(R.dimen.dp72, R.dimen.dp32)),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return null;
              }
              return R.color.ff666666;
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return null;
              }
              return R.color.fff5f5f5;
            }),
          )),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
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
            minimumSize:
                MaterialStateProperty.all(Size(R.dimen.dp72, R.dimen.dp32)),
          ))),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: R.dimen.dp7),
            child: option.selected
                ? OutlinedButton(
                    onPressed: () {},
                    child: option.mode == OptionDisplayMode.text
                        ? Text("${option.name}")
                        : _ProductSpecImageChip(
                            label: option.name, src: option.image))
                : ElevatedButton(
                    onPressed: () {},
                    child: option.mode == OptionDisplayMode.text
                        ? Text("${option.name}")
                        : _ProductSpecImageChip(
                            label: option.name, src: option.image)),
          ),
        ],
      ),
    );
  }
}

class _ProductSpecImageChip extends StatelessWidget {
  final String src;
  final String label;
  const _ProductSpecImageChip(
      {Key? key, required this.src, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChimeraImage(
          imageUrl: src,
          width: R.dimen.dp100,
          height: R.dimen.dp100,
          fit: BoxFit.cover,
          enlarge: true,
          showOpenButton: true,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: R.dimen.dp8),
          child: Text(label),
        )
      ],
    );
  }
}
