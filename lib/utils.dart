String formatDayHour(int hourIndex) {
  String hour;

  if (hourIndex == 0) {
    hour = '12 AM';
  } else if (hourIndex <= 11) {
    //0 ..11
    hour = '$hourIndex AM';
  } else {
    // 12 , 1 .. 11
    hour = '${hourIndex - 12} PM';
    if (hourIndex == 12) {
      hour = '12 PM';
    }
  }

  return hour;
}
