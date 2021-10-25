import 'package:intl/intl.dart';

String priceFormat(int price) {
  var f = NumberFormat('###,###,###,###');
  return f.format(price) + ' ~';
}
