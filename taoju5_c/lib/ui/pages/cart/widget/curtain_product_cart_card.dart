/*
 * @Description: 窗帘商品购物车卡片
 * @Author: iamsmiling
 * @Date: 2021-05-14 14:43:49
 * @LastEditTime: 2021-05-14 17:28:06
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/checkbox/c_round_checked_box.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/cart/cart_entity.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/cart/widget/curtain_attribute_key_value_card.dart';

class CurtainProductCartCard extends StatelessWidget {
  final CartEntity cart;
  final Function()? onMoveToCollection;
  final Function()? onRemoveFromCart;
  final Function()? onLongPress;
  final Future Function(CartEntity cart) onModifyAttribute;
  final Function(CartEntity cart, bool checked) onSelect;
  const CurtainProductCartCard({
    Key? key,
    required this.cart,
    required this.onMoveToCollection,
    required this.onRemoveFromCart,
    required this.onLongPress,
    required this.onModifyAttribute,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: .15,
        secondaryActions: [
          GestureDetector(
            onTap: onMoveToCollection,
            child: Container(
              width: R.dimen.dp68,
              height: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: R.color.ffff7b65),
              child: Text(
                '  移入\n收藏夹',
                style:
                    TextStyle(color: R.color.ffffffff, fontSize: R.dimen.sp12),
              ),
            ),
          ),
          GestureDetector(
            onTap: onRemoveFromCart,
            child: Container(
              width: R.dimen.dp68,
              height: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: R.color.ffff593e),
              child: Text(
                '删除',
                style:
                    TextStyle(color: R.color.ffffffff, fontSize: R.dimen.sp12),
              ),
            ),
          ),
        ],
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
          margin: EdgeInsets.only(top: R.dimen.dp24, bottom: R.dimen.dp16),
          child: Column(
            children: [
              Row(
                children: [
                  RoundCheckbox(
                    key: ValueKey(cart.checked),
                    checkedIcon: Image.asset(R.image.checkedMid),
                    uncheckedIcon: Image.asset(R.image.uncheckedMid),
                    onChanged: (bool flag) => onSelect(cart, flag),
                    value: cart.checked,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: R.dimen.dp15, right: R.dimen.dp8),
                    child: ChimeraImage(
                      imageUrl: cart.image,
                      width: R.dimen.dp84,
                      height: R.dimen.dp84,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${cart.productName}",
                                style: TextStyle(
                                    fontSize: R.dimen.dp14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "¥${cart.unitPrice.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: R.dimen.sp13,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: R.dimen.dp10,
                                vertical: R.dimen.dp4),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(R.dimen.sp3),
                            ),
                            margin: EdgeInsets.only(
                                top: R.dimen.dp6, bottom: R.dimen.dp15),
                            child: Text("${cart.description}",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: R.dimen.sp12,
                                    color: R.color.ff999999))),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: R.dimen.dp57 - R.dimen.dp20),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    CurtainAttributeKeyValueCard(
                        attributes: cart.attributes,
                        itemWidth: (R.dimen.width -
                                R.dimen.dp57 -
                                R.dimen.dp20 -
                                R.dimen.dp12 * 2) /
                            2),
                    // Positioned(
                    //   child: RotateButton(
                    //       onPressed: () =>
                    //           Future.delayed(const Duration(seconds: 2))),
                    //   right: 0,
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
