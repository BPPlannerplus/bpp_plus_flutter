import 'package:intl/intl.dart';

String priceFormat(int price) {
  var f = NumberFormat('###,###,###,###');
  return f.format(price) + ' ~';
}

String reservationDateFormat(String date) {
  int month = DateTime.parse(date).month;
  int day = DateTime.parse(date).day;
  return '$month월 $day일';
}

int calRemainigDay(String date) {
  return DateTime.parse(date).difference(DateTime.now()).inDays;
}

String changeDateFormat(String date) =>
    DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
