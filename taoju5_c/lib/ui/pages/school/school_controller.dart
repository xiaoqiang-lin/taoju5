/*
 * @Description: 淘学院
 * @Author: iamsmiling
 * @Date: 2021-04-21 13:32:24
 * @LastEditTime: 2021-04-21 14:25:56
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/school/course_entity.dart';

class SchoolController extends GetxController {
  List<String> tabs = ["推荐", "配色方案", "必买清单", "居家经验", "专题文章", "精选视频", "家具"];

  List<CourseEntity> courses = [
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
