/*
 * @Description: 商品规格选项chip
 * @Author: iamsmiling
 * @Date: 2021-04-25 16:13:58
 * @LastEditTime: 2021-07-17 15:04:17
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/image/intertaive_photo_view.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_spec_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:animations/animations.dart';

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
          margin: EdgeInsets.only(top: R.dimen.dp10),
          child: option.mode == OptionDisplayMode.text
              ? _ProductSpecLabelChip(
                  key: ObjectKey(option),
                  onPressed: onPressed,
                  label: option.name,
                  highlighted: option.selected)
              : _ProductSpecImageChip(
                  key: ObjectKey(option),
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
              child: Text(
                label,
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: highlighted ? Colors.white : const Color(0xffF5F5F5),
                  border: Border.all(
                      color:
                          highlighted ? R.color.ffee9b5f : Colors.transparent)),
              constraints: BoxConstraints(
                  minHeight: R.dimen.dp32, minWidth: R.dimen.dp70),
            ),
          ],
        ));
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
    double w = (R.dimen.width -
            R.dimen.dp20 * 2 -
            R.dimen.dp18 * 2 -
            R.dimen.dp1 * 6) /
        3.0001;
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(R.dimen.sp7),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(R.dimen.sp7),
              border: Border.all(
                  color: !highlighted
                      ? Colors.transparent
                      : const Color(0xFFFFEE9B5F))),
          child: Column(
            children: [
              Stack(
                children: [
                  ChimeraImage(
                    src,
                    key: ValueKey(src),
                    width: w,
                    height: w,
                    fit: BoxFit.cover,
                    enlarge: false,
                    placeHolder: (_, __) => SizedBox.shrink(),
                    picture: PictureEntity(id: src, cover: src, bigImage: src),

                    // heroTag: src,
                    // magnifier: Image.asset(R.image.scale),
                    // magnifierMarginTop: R.dimen.dp7,
                    // magnifierMarginRight: R.dimen.dp7,
                  ),
                  Positioned(
                    right: R.dimen.dp7,
                    top: R.dimen.dp7,
                    child: OpenContainer(
                      closedBuilder: (BuildContext context, _) {
                        return Image.asset(
                          R.image.scale,
                        );
                      },
                      closedColor: Colors.transparent,
                      closedElevation: 0,
                      openColor: Colors.transparent,
                      middleColor: Colors.transparent,
                      openElevation: 0,
                      transitionType: ContainerTransitionType.fadeThrough,
                      openBuilder: (BuildContext context,
                          void Function({Object? returnValue}) action) {
                        return InteractivePhotoView(
                          pictures: [
                            PictureEntity(cover: src, bigImage: src, id: src)
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: R.dimen.dp8),
                child: Text(
                  label,
                  style: TextStyle(fontSize: R.dimen.sp12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
