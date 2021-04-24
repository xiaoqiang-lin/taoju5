/*
 * @Description: 淘学院
 * @Author: iamsmiling
 * @Date: 2021-04-21 13:32:24
 * @LastEditTime: 2021-04-23 09:54:43
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/school/course_entity.dart';

class SchoolController extends GetxController {
  List<String> tabs = ["推荐", "配色方案", "必买清单", "居家经验", "专题文章", "精选视频", "家具"];

  List<CourseEntity> courses = [
    CourseEntity(
        cover:
            "https://i0.hdslb.com/bfs/archive/4cacc43260fc815e476b31a84f2f86bbe44a4eb9.jpg",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 600,
        isVideo: true,
        href:
            "https://cn-jsnj3-cmcc-v-06.bilivideo.com/upgcxcode/64/40/324054064/324054064-1-400.mp4?e=ig8euxZM2rNcNbRMhbUVhoM17wNBhwdEto8g5X10ugNcXBMvNC8xNbLEkF6MuwLStj8fqJ0EkX1ftx7Sqr_aio8_&uipk=5&nbs=1&deadline=1619115387&gen=playurlv2&os=vcache&oi=3086610213&trid=6cb7ec839f8f440ba6dfc8131940850dp&platform=html5&upsig=f66b1e223afcf63ec79e88254fa8e464&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,platform&cdnid=4080&mid=156940475&orderid=0,1&logo=80000000"),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x600",
        id: 1,
        desc: "png切图",
        ratio: 400 / 600,
        isVideo: false,
        type: 1,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x300",
        id: 1,
        desc: "png全图",
        ratio: 400 / 300,
        isVideo: false,
        type: 2,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x500",
        id: 1,
        desc: "webp切图",
        ratio: 400 / 500,
        isVideo: false,
        type: 3,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x400",
        id: 1,
        desc: "webp全图",
        ratio: 400 / 400,
        isVideo: false,
        type: 4,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x600",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 600,
        isVideo: false,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x300",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 300,
        isVideo: false,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x500",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 500,
        isVideo: false,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x400",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 400,
        isVideo: false,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x600",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 600,
        isVideo: false,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x300",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 300,
        isVideo: false,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x500",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 500,
        isVideo: false,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x400",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 400,
        isVideo: false,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x600",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 600,
        isVideo: false,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x300",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 300,
        isVideo: false,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x500",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 500,
        isVideo: false,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x400",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 400,
        isVideo: false,
        href: ""),
    CourseEntity(
        cover: "http://source.unsplash.com/random/400x600",
        id: 1,
        desc:
            """Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis quod et
      deleniti nobis quasi ad, adipisci perferendis totam, ducimus incidunt
      dolore aut, quae quaerat architecto quisquam repudiandae amet nostrum
      quidem?""",
        ratio: 400 / 600,
        isVideo: false,
        href: ""),
  ];
}
