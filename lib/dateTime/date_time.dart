String convertDateTimeToString(DateTime dateTime) {
  //covert the year
  String year = dateTime.year.toString();
  //covert the month
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }
  //covert the day
  String day = dateTime.day.toString();
  if (month.length == 1) {
    day = '0$day';
  }
  String yymmdd = year + month + day;
  return yymmdd;
}
