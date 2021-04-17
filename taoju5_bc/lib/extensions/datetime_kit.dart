/*
 * @Description: DateTime扩展方法
 * @Author: iamsmiling
 * @Date: 2020-12-22 09:23:47
 * @LastEditTime: 2020-12-22 09:24:03
 */
extension DatetimeKit on DateTime {
  String formatDate({String format = "yyyy-MM-dd HH:mm:ss"}) {
    String _comFormat(int value, String format, String single, String full) {
      if (format.contains(single)) {
        if (format.contains(full)) {
          format = format.replaceAll(
              full, value < 10 ? '0$value' : value.toString());
        } else {
          format = format.replaceAll(single, value.toString());
        }
      }

      return format;
    }

    if (this == null) return "";
    if (format.contains("yy")) {
      String year = this.year.toString();
      if (format.contains("yyyy")) {
        format = format.replaceAll("yyyy", year);
      } else {
        format = format.replaceAll(
            "yy", year.substring(year.length - 2, year.length));
      }
    }

    format = _comFormat(this.month, format, 'M', 'MM');
    format = _comFormat(this.day, format, 'd', 'dd');
    format = _comFormat(this.hour, format, 'H', 'HH');
    format = _comFormat(this.minute, format, 'm', 'mm');
    format = _comFormat(this.second, format, 's', 'ss');
    format = _comFormat(this.millisecond, format, 'S', 'SSS');

    return format;
  }

  DateTime getDateTimeByMs(int ms, {bool isUtc = false}) {
    return ms == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(ms, isUtc: isUtc);
  }

  String formatDateMs(int ms, {bool isUtc = false, String format}) {
    return formatDate(format: format);
  }
}
