/*
 * @Description: 场景定制商品卡片
 * @Author: iamsmiling
 * @Date: 2021-07-22 13:37:32
 * @LastEditTime: 2021-08-05 15:38:19
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/rotate_button.dart';
import 'package:taoju5_c/component/checkbox/c_round_checked_box.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_product_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/cart/widget/curtain_attribute_key_value_card.dart';

class SceneCustomProductCard extends StatefulWidget {
  final SceneProductEntity product;
  final Function(SceneProductEntity, bool) onSelect;
  final Future Function(SceneProductEntity) onModify;
  const SceneCustomProductCard(
      {Key? key,
      required this.product,
      required this.onSelect,
      required this.onModify})
      : super(key: key);

  @override
  _SceneCustomProductCardState createState() => _SceneCustomProductCardState();
}

class _SceneCustomProductCardState extends State<SceneCustomProductCard> {
  late Completer completer = Completer();

  bool expanded = false;
  Future expand() {
    if (expanded) {
      completer.complete();
      expanded = false;
    } else {
      widget.onModify(widget.product).then((value) {
        expanded = false;
        completer.complete();
      });
      completer = Completer();
      expanded = true;
    }
    setState(() {});
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              RoundCheckbox(
                value: widget.product.selected,
                onChanged: (bool f) => widget.onSelect(widget.product, f),
                checkedIcon: Image.asset(R.image.checkedMid),
                uncheckedIcon: Image.asset(R.image.uncheckedMid),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: R.dimen.dp15),
                  child: Row(
                    children: [
                      ChimeraImage(
                        widget.product.image,
                        width: R.dimen.dp85,
                        height: R.dimen.dp85,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: R.dimen.dp8, top: R.dimen.dp4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.product.name,
                                      style: TextStyle(
                                          fontSize: R.dimen.sp14,
                                          color: R.color.ff333333,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "¥${widget.product.price}",
                                      style: TextStyle(
                                          fontSize: R.dimen.sp13,
                                          color: R.color.ff333333),
                                    )
                                  ]),
                              widget.product.productType
                                      is FabricCurtainProductType
                                  ? Container(
                                      margin:
                                          EdgeInsets.only(top: R.dimen.dp10),
                                      child: Text(
                                        widget.product.description,
                                        style: TextStyle(
                                            fontSize: R.dimen.sp12,
                                            color: R.color.ff999999),
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              R.dimen.sp3),
                                          color: R.color.fff8f8f8),
                                      margin:
                                          EdgeInsets.only(top: R.dimen.dp13),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: R.dimen.dp10,
                                          vertical: R.dimen.dp4),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.product.description,
                                              style: TextStyle(
                                                  fontSize: R.dimen.sp12,
                                                  color: R.color.ff999999),
                                            ),
                                            Spacer(),
                                            RotateButton(onPressed: expand)
                                          ]))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Visibility(
            visible: widget.product.pairs.isNotEmpty,
            child: Container(
              margin: EdgeInsets.only(left: R.dimen.dp36, top: R.dimen.dp10),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  CurtainAttributeKeyValueCard(
                      attributes: widget.product.pairs,
                      itemWidth: R.dimen.dp120),
                  Positioned(
                      right: R.dimen.dp10,
                      child: RotateButton(onPressed: expand))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: R.dimen.dp36, top: R.dimen.dp12, bottom: R.dimen.dp20),
            child: Row(
              children: [
                Text(
                  "小计:¥${widget.product.totalPrice}",
                  style: TextStyle(
                      fontSize: R.dimen.sp12,
                      color: R.color.ffff5005,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => widget.onModify(widget.product),
                  child: Row(
                    children: [
                      Text(
                        "修改加购信息",
                        style: TextStyle(
                            fontSize: R.dimen.sp12, color: R.color.ffee9b5f),
                      ),
                      Image.asset(
                        R.image.next,
                        color: R.color.ffee9b5f,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
