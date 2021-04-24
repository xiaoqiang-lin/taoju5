/*
 * @Description: 视屏播放页面
 * @Author: iamsmiling
 * @Date: 2021-04-22 22:20:46
 * @LastEditTime: 2021-04-24 13:02:42
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/video/video_player_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: R.color.ff00000,
          appBar: AppBar(
            iconTheme: IconThemeData(color: R.color.ffffffff),
            backgroundColor: R.color.ff00000,
            actions: [
              IconButton(
                icon: Image.asset(R.image.hasCollected),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(R.image.share),
                onPressed: () {},
              )
            ],
          ),
          body: Container(
            height: double.maxFinite,
            child: Stack(
              children: [
                Container(
                    child: GestureDetector(
                  onDoubleTap: _.pause,
                  behavior: HitTestBehavior.translucent,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      AspectRatio(
                        aspectRatio: _.videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_.videoPlayerController),
                      ),
                      Positioned.fill(
                          child: Obx(() => Visibility(
                              visible: _.progress.value == 0 ||
                                  _.progress.value == 1,
                              child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: _.play,
                                  child: Image.asset(R.image.play)))))
                    ],
                  ),
                )),
                Positioned(
                  bottom: R.dimen.dp20,
                  child: Container(
                    color: R.color.transparent,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: R.dimen.sp24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "窗帘选购你最看重那一方面，来看别人怎么选",
                                style: TextStyle(
                                    color: R.color.ffffffff,
                                    fontSize: R.dimen.sp15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: R.dimen.dp12),
                                child: Text(
                                  "2012-03-28",
                                  style: TextStyle(
                                      fontSize: R.dimen.sp11,
                                      color: R.color.ffffffff),
                                ),
                              ),
                              Text(
                                "客厅空间的设计，通过块面和线条的塑造使其更具包容性天花深咖色的不锈钢疊级与墙面竖向的不锈钢收边，突显了空间的",
                                style: TextStyle(
                                    fontSize: R.dimen.sp11,
                                    color: R.color.ffffffff),
                              ),
                            ],
                          ),
                        ),
                        Obx(() => SliderTheme(
                            data: SliderThemeData(
                                trackHeight: 1,
                                thumbShape: RoundSliderThumbShape(
                                    elevation: 0, enabledThumbRadius: 3),
                                inactiveTrackColor:
                                    R.color.ffffffff.withOpacity(.4),
                                thumbColor: R.color.ffffffff,
                                activeTrackColor: R.color.ffffffff),
                            child: Slider(
                                value: _.progress.value, onChanged: _.seetkTo)))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
