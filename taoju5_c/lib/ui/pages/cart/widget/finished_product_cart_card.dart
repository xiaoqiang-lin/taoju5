/*
 * @Description:成品购物车卡片
 * @Author: iamsmiling
 * @Date: 2021-04-29 16:20:32
 * @LastEditTime: 2021-05-31 09:40:03
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/rotate_button.dart';
import 'package:taoju5_c/component/checkbox/c_round_checked_box.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/step_counter/step_counter.dart';
import 'package:taoju5_c/domain/entity/cart/cart_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FinishedProductCartCard extends StatelessWidget {
  final CartEntity cart;
  final Function()? onMoveToCollection;
  final Function()? onRemoveFromCart;
  final Function()? onLongPress;
  final Future Function(CartEntity cart) onModifyAttribute;
  final Function(CartEntity cart, bool checked) onSelect;
  final Function(CartEntity cart, int i) onCountChange;
  const FinishedProductCartCard(
      {Key? key,
      required this.cart,
      required this.onMoveToCollection,
      required this.onRemoveFromCart,
      required this.onLongPress,
      required this.onModifyAttribute,
      required this.onSelect,
      required this.onCountChange})
      : super(key: key);

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
                      cart.image,
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
                              horizontal: R.dimen.dp10, vertical: R.dimen.dp4),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(R.dimen.sp3),
                              color: R.color.fff5f5f5),
                          margin: EdgeInsets.only(
                              top: R.dimen.dp6, bottom: R.dimen.dp15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${cart.description}",
                                  style: TextStyle(
                                      fontSize: R.dimen.sp10,
                                      color: R.color.ff999999)),
                              RotateButton(
                                  onPressed: () => onModifyAttribute(cart))
                            ],
                          ),
                        ),
                        StepCounter(
                          key: ValueKey(cart.count),
                          initialValue: cart.count,
                          onChanged: (int i) => onCountChange(cart, i),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
