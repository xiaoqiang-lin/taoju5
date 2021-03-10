/*
 * @Description: map方法拓展
 * @Author: iamsmiling
 * @Date: 2020-12-21 09:41:02
 * @LastEditTime: 2020-12-21 09:54:36
 */

extension MapKit on Map {
  ///[getValueByKey] 通过键名获取值
  ///[name] 键名
  ///[ifListReturnFirst] 如果值是list,只取第一个
  Object getValueByKey(dynamic name, {bool onlyFirst = false}) {
    if (this == null && (this is Map) == false) return this;
    var value = this[name];
    if (value is List) {
      if (value.isEmpty) {
        return value;
      }
      if (onlyFirst) {
        return value.first;
      }
    }
    return value;
  }

  /// [_getValueInComplexMap]私有方法,通过递归方式获取值
  /// [map] 需要查找的map
  /// [keys] 键列表
  /// [startIndex] 开始下标
  Object _getValueInComplexMap(Map map, List<dynamic> keys, int startIndex) {
    if (this == null && (this is Map) == false) return this;
    int len = keys.length;
    if (len == 0) return null;
    if (len == 1) return map[keys?.first];
    var key = keys[startIndex];
    var value = map.getValueByKey(key) ?? map.getValueByKey(key);
    if (startIndex == len - 1) return value;
    if (value is Map) {
      map = value;
      return _getValueInComplexMap(map, keys, ++startIndex);
    }
    return value;
  }

  /// [getValueInComplexMap] 传入一组键名 获取相应的值
  Object getValueInComplexMap(List<dynamic> keys) {
    return _getValueInComplexMap(this, keys, 0);
  }
}
