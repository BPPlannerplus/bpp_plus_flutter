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
  return DateTime.parse(date)
      .difference(
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        ),
      )
      .inDays;
}

String changeDateFormat(String date) =>
    DateFormat('yyyy-MM-dd').format(DateTime.parse(date));

String changeReviewDateFormat(String date) {
  String _date = DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
  List<String> dates = _date.split('-');
  return dates[0].substring(2, 4) + '.' + dates[1] + '.' + dates[2];
}

String changeReviewNameFormat(String name) {
  String _name = name.substring(0, 1);
  return _name + '*' * (name.length - 1);
}

double calReviewScore(List<int> scores) {
  int _score = 0;
  for (var element in scores) {
    _score += element;
  }
  return _score / scores.length;
}
