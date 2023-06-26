class TotalTimeHelper {
  //total hours
  var _totalH = 0;
  //total minutes
  var _totalM = 0;
  //total seconds
  var _totalS = 0;

  //remove time from total time
  void removeTotalTime(int h, int m, int s) {
    _totalS -= s;
    if (_totalS < 0) {
      _totalM -= 1;
      _totalS += 60;
    }
    _totalM -= m;
    if (_totalM < 0) {
      _totalH -= 1;
      _totalM += 60;
    }
    _totalH -= h;
  }

  //adding to total time a amounts hours, minutes and seconds
  void addTotalTime(int h, int m, int s) {
    _totalS += s;
    if (_totalS > 59) {
      _totalM += 1;
      _totalS -= 60;
    }
    _totalM += m;
    if (_totalM > 59) {
      _totalH += 1;
      _totalM -= 60;
    }
    _totalH += h;
  }

  //return time in scheme 00:00:00 or 0:00:00
  String getTime() {
    final String mString = (_totalM < 10) ? "0$_totalM" : "$_totalM";
    final String sString = (_totalS < 10) ? "0$_totalS" : "$_totalS";
    return "$_totalH:$mString:$sString";
  }
}
