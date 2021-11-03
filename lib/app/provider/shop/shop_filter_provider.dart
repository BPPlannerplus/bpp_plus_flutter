import 'package:bpp_riverpod/app/model/filter_check_pair.dart';
import 'package:bpp_riverpod/app/util/filter_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopFilterCheckState extends StateNotifier<List<FilterCheckPair>> {
  ShopFilterCheckState({
    required this.filters,
  }) : super(
          filters,
        );

  final List<FilterCheckPair> filters;

  toggleFilterState(int num) {
    var n = state[num].copyWith(check: !state[num].check);
    var cur = state;
    cur[num] = n;
    state = [...cur];
  }

  List<String> makeFilter() {
    List<String> filter = [];
    for (var i = 0; i < state.length; i++) {
      if (state[i].check) {
        filter.add(state[i].value);
      }
    }
    return filter;
  }
}

final studioFilterProvider =
    StateNotifierProvider<ShopFilterCheckState, List<FilterCheckPair>>(
  (ref) => ShopFilterCheckState(
      filters: studioFilterValue.entries
          .map<FilterCheckPair>(
              (data) => FilterCheckPair(id: data.key, value: data.value))
          .toList()),
);

final hairFilterProvider =
    StateNotifierProvider<ShopFilterCheckState, List<FilterCheckPair>>(
  (ref) => ShopFilterCheckState(
      filters: beautyFilterValue.entries
          .map<FilterCheckPair>(
              (data) => FilterCheckPair(id: data.key, value: data.value))
          .toList()),
);

final waxingFilterProvider =
    StateNotifierProvider<ShopFilterCheckState, List<FilterCheckPair>>(
  (ref) => ShopFilterCheckState(
      filters: waxingFilterValue.entries
          .map<FilterCheckPair>(
              (data) => FilterCheckPair(id: data.key, value: data.value))
          .toList()),
);

final tanningFilterProvider =
    StateNotifierProvider<ShopFilterCheckState, List<FilterCheckPair>>(
  (ref) => ShopFilterCheckState(
      filters: tanningFilterValue.entries
          .map<FilterCheckPair>(
              (data) => FilterCheckPair(id: data.key, value: data.value))
          .toList()),
);
