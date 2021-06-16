/*
 * @Description: 门店卡片
 * @Author: iamsmiling
 * @Date: 2021-06-08 16:08:22
 * @LastEditTime: 2021-06-08 16:23:41
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/res/R.dart';

class PhysicialStorePlusCard extends StatelessWidget {
  const PhysicialStorePlusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: R.dimen.width - R.dimen.dp20 * 2,
      height: R.dimen.width - R.dimen.dp20 * 2 * (260 / 335),
      margin: EdgeInsets.only(right: R.dimen.dp10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(R.dimen.sp7),
          border: Border.all(color: R.color.ffe5e5e5)),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            children: [
              ChimeraImage(
                "https://i.loli.net/2021/04/13/2VkqWFU5sxwSQcu.png",
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(R.dimen.sp7),
                    topRight: Radius.circular(R.dimen.sp7)),
                height: R.dimen.dp90,
                width: R.dimen.dp200,
                fit: BoxFit.fill,
              ),
              Container(
                margin: EdgeInsets.only(top: R.dimen.dp20),
                child: Text(
                  "门店名称",
                  style: TextStyle(
                      fontSize: R.dimen.sp12, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: R.dimen.dp5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(R.image.starLevel),
                    Container(
                      margin: EdgeInsets.only(
                        left: R.dimen.dp3,
                        right: R.dimen.dp10,
                      ),
                      child: Text(
                        "4.9分",
                        style: TextStyle(
                            color: R.color.ff5005, fontSize: R.dimen.sp10),
                      ),
                    ),
                    Text(
                      "累计成交单数245",
                      style: TextStyle(
                          color: R.color.ff00000, fontSize: R.dimen.sp10),
                    )
                  ],
                ),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(R.dimen.dp44 / 2),
            child: Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202003%2F26%2F20200326190143_vRnnf.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621503756&t=4c7d0cd048ba77776bc5261dd05c036a",
              width: R.dimen.dp44,
              height: R.dimen.dp44,
            ),
          )
        ],
      ),
    );
  }
}
