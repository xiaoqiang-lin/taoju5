/*
 * @Description: 商品规格选项chip
 * @Author: iamsmiling
 * @Date: 2021-04-25 16:13:58
 * @LastEditTime: 2021-04-26 17:25:17
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/product_spec_entity.dart';
import 'package:taoju5_c/res/R.dart';

class ProductSpecOptionChip extends StatelessWidget {
  final ProductSpecOptionEntity option;
  final Function() onPressed;
  const ProductSpecOptionChip(
      {Key? key, required this.option, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: R.dimen.dp10, right: R.dimen.dp4),
          child: option.mode == OptionDisplayMode.text
              ? _ProductSpecLabelChip(
                  onPressed: onPressed,
                  label: option.name,
                  highlighted: option.selected)
              : _ProductSpecImageChip(
                  onPressed: onPressed,
                  highlighted: option.selected,
                  label: option.name,
                  src: option.image),
        ),
        Positioned(
            top: R.dimen.dp5,
            right: -R.dimen.dp2,
            child: Visibility(
                visible: !option.isOutofStock,
                child: _OutOfStockTag(highlighted: option.selected)))
      ],
    );
  }
}

class _OutOfStockTag extends StatelessWidget {
  final String label;
  final bool highlighted;
  const _OutOfStockTag(
      {Key? key, this.label = "暂时缺货", this.highlighted = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color:
              highlighted ? const Color(0xFFEE9B5F) : const Color(0xFFC1C1C1)),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 5, color: Colors.white),
      ),
    );
  }
}

class _ProductSpecLabelChip extends StatelessWidget {
  final String label;
  final bool highlighted;
  final Function()? onPressed;
  const _ProductSpecLabelChip(
      {Key? key, required this.label, this.highlighted = false, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: highlighted ? Colors.white : const Color(0xffF5F5F5),
            border: Border.all(
                color: highlighted
                    ? const Color(0xffee9b5f)
                    : Colors.transparent)),
        constraints: BoxConstraints(
            minHeight: R.dimen.dp32,
            maxWidth: R.dimen.dp72,
            minWidth: R.dimen.dp72),
      ),
    );
  }
}

///图片
class _ProductSpecImageChip extends StatelessWidget {
  final String src;
  final String label;
  final Function()? onPressed;
  final bool highlighted;
  const _ProductSpecImageChip(
      {Key? key,
      required this.src,
      required this.label,
      this.onPressed,
      this.highlighted = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                  color: highlighted
                      ? Colors.transparent
                      : const Color(0xFFFFEE9B5F))),
          child: Column(
            children: [
              Image.network(
                src,
                width: R.dimen.dp100,
                height: R.dimen.dp100,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: R.dimen.dp8),
                child: Text(label),
              )
            ],
          ),
        ),
      ),
    );
  }
}
