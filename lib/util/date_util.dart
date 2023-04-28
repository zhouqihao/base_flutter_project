import 'package:intl/intl.dart';

class DateUtil {
  static String formatStrFull = "yyyy-MM-dd HH:mm:ss";

  static int _oneDayMillSecond = 86400000;

  /***
   * 获取零点时间 @return 返回13位毫秒时间戳
   * day 不传或者为0，获取今日的零点时间
   * day  传1获取昨天的零点时间
   * day 传-1获取明天的零点时间
   * */
  static int getZeroTimeMillis({int day = 0}) {
    DateTime dateTime = new DateTime.now();
    DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);
    return date.millisecondsSinceEpoch - day * _oneDayMillSecond;
  }

  ///格式化时间
  static String formatTime(DateTime dateTime, {String? formatStr}) {
    DateFormat format = DateFormat(formatStr ?? formatStrFull);
    return format.format(dateTime);
  }



}
