import 'package:intl/intl.dart';
import 'package:outfit_flutter/classes/time.dart';
import 'package:outfit_flutter/utils/total_time_helper.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

class TimeUtils {
  static WorkTime generateWorkTime(int duration) {
    final minutes = (duration / 60).truncate();
    final hours = (minutes / 60).truncate();
    final remainingMinutes = minutes % 60;
    final remainingSeconds = duration % 60;
    final now = DateTime.now();
    final formattedDateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(now);
    return WorkTime(
      sId: '',
      hour: hours,
      minute: remainingMinutes,
      second: remainingSeconds,
      date: formattedDateTime,
    );
  }

  static String stringifyTimeByInt(int duration) {
    final minutes = (duration / 60).truncate();
    final hours = (minutes / 60).truncate();
    final remainingMinutes = minutes % 60;
    final remainingSeconds = duration % 60;

    final helper = TotalTimeHelper();

    helper.addTotalTime(hours, remainingMinutes, remainingSeconds);

    return helper.getTime();
  }

  static String stringifyTime(Time? time) {
    if (time == null) {
      return '00:00:00';
    }
    final String mString = (time.minute < 10) ? "0${time.minute}" : "${time.minute}";
    final String sString = (time.second < 10) ? "0${time.second}" : "${time.second}";
    return "${time.hour}:$mString:$sString";
  }
}
