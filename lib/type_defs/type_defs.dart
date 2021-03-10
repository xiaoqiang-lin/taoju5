/*
 * @Description: 别名类型定义
 * @Author: iamsmiling
 * @Date: 2020-12-17 10:37:03
 * @LastEditTime: 2021-01-11 13:40:29
 */

/// 返回future的回调函数
/// [params] 可选位置参数 以数组方式传入
/// [return] future
typedef FutureCallback<T> = Future<T> Function();

typedef StringifyCallback<T> = String Function(T value);
