/*
 * @Description: 场景详情
 * @Author: iamsmiling
 * @Date: 2021-05-29 10:31:44
 * @LastEditTime: 2021-07-30 10:25:12
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/scene/scene_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/component/product_card.dart';

class SceneDetailBody extends StatelessWidget {
  final SceneDetailEntity scene;
  const SceneDetailBody({Key? key, required this.scene}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
      child: Column(
        children: [
          Visibility(
            visible: scene.products.isNotEmpty,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: R.dimen.dp18,
                    bottom: R.dimen.dp12,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "包含商品",
                        style: TextStyle(
                            fontSize: R.dimen.sp14,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: R.dimen.dp6),
                        child: Text(
                          "(${scene.products.length})",
                          style: TextStyle(
                              fontSize: R.dimen.sp9,
                              color: R.color.ff999999,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Spacer(),
                      Container(
                          margin: EdgeInsets.only(right: R.dimen.dp2),
                          child: Text(
                            "查看全部",
                            style: TextStyle(
                                fontSize: R.dimen.sp12,
                                color: R.color.ffb4b4b4),
                          )),
                      Image.asset(R.image.next),
                    ],
                  ),
                ),
                Container(
                  height: R.dimen.width * 216 / 375,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: scene.products.length,
                    itemBuilder: (BuildContext context, int i) {
                      double w = (R.dimen.width -
                              R.dimen.dp20 * 2 -
                              R.dimen.dp10 * 2) /
                          3.00001;
                      return Container(
                        margin: EdgeInsets.only(right: R.dimen.dp10),
                        width: w,
                        height: w * 171 / 105,
                        child:
                            ProductCard(width: w, product: scene.products[i]),
                      );
                    },
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp20, bottom: R.dimen.dp10),
            child: Row(
              children: [
                Text(
                  "#设计师说",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: R.dimen.sp14,
                      color: R.color.ff333333),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: R.dimen.dp10,
                  ),
                  child: Text(
                    "来看看专业设计师设计理念吧",
                    style: TextStyle(
                        fontSize: R.dimen.dp10, color: R.color.ff999999),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: R.dimen.dp160 + R.dimen.dp40 + R.dimen.dp36,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int i) {
                DesignerCommentEntity item = scene.comments[i];
                return Container(
                  width: R.dimen.dp160,
                  margin: EdgeInsets.only(right: R.dimen.dp15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChimeraImage(
                        item.cover,
                        height: R.dimen.dp185,
                        width: R.dimen.dp160,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: R.dimen.dp6),
                        child: Row(
                          children: [
                            ChimeraImage(
                              item.avatar,
                              width: R.dimen.dp24,
                              height: R.dimen.dp24,
                              borderRadius:
                                  BorderRadius.circular(R.dimen.dp24 / 2),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: R.dimen.dp5),
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                      fontSize: R.dimen.sp12,
                                      fontWeight: FontWeight.w600,
                                      color: R.color.ffee9b5f),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                          child: Text(
                        item.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: R.dimen.sp12),
                      ))
                    ],
                  ),
                );
              },
              itemCount: scene.comments.length,
            ),
          )
        ],
      ),
    );
  }
}
