import 'package:flutter_riverpod/flutter_riverpod.dart';

final yearProvider = StateProvider<int>((ref) => DateTime.now().year);

final monthProvider =
    StateNotifierProvider<MonthState, List<int>>((ref) => MonthState());

final dayProvider =
    StateNotifierProvider<DayState, List<int>>((ref) => DayState());

class MonthState extends StateNotifier<List<int>> {
  MonthState()
      : super(List.generate(13 - DateTime.now().month,
            (index) => DateTime.now().month + index));

  void setMonth(int year) {
    if (year == DateTime.now().year) {
      state = List.generate(
          13 - DateTime.now().month, (index) => DateTime.now().month + index);
    } else {
      state = List.generate(12, (index) => index + 1);
    }
  }
}

class DayState extends StateNotifier<List<int>> {
  DayState() : super([]);

  final day31 = [1, 3, 5, 7, 8, 10, 12];

  int _calcDayCountOfMonth(int year, int month) {
    if (month == 2) {
      return isLeapYear(year) ? 29 : 28;
    } else if (day31.contains(month)) {
      return 31;
    }
    return 30;
  }

  bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }

  void setDay(int year, int month) {
    if (month == DateTime.now().month) {
      state = List.generate(
          _calcDayCountOfMonth(year, month) - DateTime.now().day + 1,
          (index) => DateTime.now().day + index);
    } else {
      state = List.generate(
          _calcDayCountOfMonth(year, month), (index) => index + 1);
    }
  }
}
