import 'package:bpp_riverpod/app/model/filter_check_pair.dart';
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
    filters: [
      FilterCheckPair(id: '강남구', value: '강남구'),
      FilterCheckPair(id: '강동구', value: '강동구'),
      FilterCheckPair(id: '광진구', value: '광진구'),
      FilterCheckPair(id: '마포구', value: '마포구'),
      FilterCheckPair(id: '서초구', value: '서초구'),
    ],
  ),
);

final hairFilterProvider =
    StateNotifierProvider<ShopFilterCheckState, List<FilterCheckPair>>(
  (ref) => ShopFilterCheckState(
    filters: [
      FilterCheckPair(id: '강남구', value: '강남구'),
      FilterCheckPair(id: '서초구', value: '서초구'),
    ],
  ),
);

final waxingFilterProvider =
    StateNotifierProvider<ShopFilterCheckState, List<FilterCheckPair>>(
  (ref) => ShopFilterCheckState(
    filters: [
      FilterCheckPair(id: '강남구', value: '강남구'),
      FilterCheckPair(id: '강동구', value: '강동구'),
      FilterCheckPair(id: '광진구', value: '광진구'),
      FilterCheckPair(id: '마포구', value: '마포구'),
      FilterCheckPair(id: '서초구', value: '서초구'),
    ],
  ),
);

final tanningFilterProvider =
    StateNotifierProvider<ShopFilterCheckState, List<FilterCheckPair>>(
  (ref) => ShopFilterCheckState(
    filters: [
      FilterCheckPair(id: '강남구', value: '강남구'),
      FilterCheckPair(id: '강동구', value: '강동구'),
      FilterCheckPair(id: '광진구', value: '광진구'),
      FilterCheckPair(id: '마포구', value: '마포구'),
      FilterCheckPair(id: '서초구', value: '서초구'),
    ],
  ),
);
