/*
 * @Description:sdk初始化器
 * @Author: iamsmiling
 * @Date: 2020-12-16 10:38:37
 * @LastEditTime: 2020-12-16 10:39:54
 */

abstract class ISdkInitializer {
  ///[hasInited] 用来判断sdk是否已经被初始化过
  bool hasInited;

  void init();

  void release();
}
