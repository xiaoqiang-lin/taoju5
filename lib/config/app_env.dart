/*
 * @Description: app环境
 * @Author: iamsmiling
 * @Date: 2021-02-02 17:32:32
 * @LastEditTime: 2021-08-06 11:24:09
 */
enum AppEnv { $b, $c }
enum AppMode { release, debug }
String getAppName({AppEnv env = AppEnv.$b, AppMode mode = AppMode.debug}) {
  Map<String, String> map = {
    {AppEnv.$b, AppMode.debug}.toString(): "淘居屋",
    {AppEnv.$b, AppMode.release}.toString(): "淘居屋",
    {AppEnv.$c, AppMode.debug}.toString(): "淘居屋",
    {AppEnv.$c, AppMode.release}.toString(): "淘居屋",
  };
  return map[{env, mode}.toString()];
}

String getServerHost({AppEnv env = AppEnv.$b, AppMode mode = AppMode.release}) {
  Map<String, String> map = {
    {AppEnv.$b, AppMode.debug}.toString(): "https://buyiweb.taoju5.com",
    {AppEnv.$b, AppMode.release}.toString(): "https://buyiweb.taoju5.com",
    {AppEnv.$c, AppMode.debug}.toString(): "https://buyiweb.taoju5.com",
    {AppEnv.$c, AppMode.release}.toString(): "https://buyiweb.taoju5.com",
  };
  return map[{env, mode}.toString()];
}
