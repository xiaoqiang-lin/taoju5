/*
 * @Description: 视屏播放逻辑处理
 * @Author: iamsmiling
 * @Date: 2021-04-22 22:21:17
 * @LastEditTime: 2021-07-16 14:51:42
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/school/article_detail_entity.dart';
import 'package:taoju5_c/domain/repository/school_repository.dart';
import 'package:video_player/video_player.dart';

class VideoController
    extends BaseFutureLoadStateController<ArticleDetailEntity> {
  SchoolRepository _repository = SchoolRepository();
  late VideoPlayerController videoPlayerController;

  final progress = 0.0.obs;

  final isPlaying = false.obs;

  @override
  void onInit() {
    print(Get.parameters);
    videoPlayerController = VideoPlayerController.network(
        "http://buyi.taoju5.com//upload/goods_video/2021042310313757613.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        update();
        videoPlayerController.play();
      })
      ..addListener(_updateProgress);
    super.onInit();
  }

  void _updateProgress() async {
    int seconds = videoPlayerController.value.duration.inMilliseconds;
    if (seconds == 0) {
      progress.value = 1.0;
    }

    Duration? pos = await videoPlayerController.position;
    if (pos == null) return;
    int current = pos.inMilliseconds;
    progress.value = current / seconds >= 1.0 ? 1.0 : current / seconds;

    print("当前进度---$current----总时长---$seconds---百分比--${progress.value}");
  }

  void seetkTo(double val) {
    videoPlayerController.pause();
    progress.value = val;

    videoPlayerController
        .seekTo(Duration(
            milliseconds:
                (val * videoPlayerController.value.duration.inMilliseconds)
                    .toInt()))
        .then((value) {
      videoPlayerController.play();
    });
  }

  void play() {
    print("我被电击了");
    if (videoPlayerController.value.isPlaying) return;
    if (progress.value == 1) {
      videoPlayerController.seekTo(Duration(milliseconds: 0));
      progress.value = 0;
    }
    videoPlayerController.play();
  }

  void pause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      isPlaying.value = false;
    } else {
      isPlaying.value = true;
      videoPlayerController.play();
    }
  }

  @override
  void onClose() {
    videoPlayerController.removeListener(_updateProgress);
    videoPlayerController.pause();
    videoPlayerController.dispose();
    super.onClose();
  }

  @override
  Future<ArticleDetailEntity> loadData({Map? params}) {
    return _repository.getArticleDetail({"article_id": Get.parameters["id"]});
  }
}
