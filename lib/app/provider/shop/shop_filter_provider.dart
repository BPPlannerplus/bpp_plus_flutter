import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/model/filter_check_pair.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_type_provider.dart';
import 'package:bpp_riverpod/app/util/filter_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopFilterProvider = Provider.autoDispose<List<FilterCheckPair>>((ref) {
  final shopType = ref.watch(shopTypeProvider);
  switch (shopType) {
    case ShopType.stduio:
      return ref.watch(studioFilterProvider);
    case ShopType.beauty:
      return ref.watch(beautyFilterProvider);
    case ShopType.waxing:
      return ref.watch(waxingFilterProvider);
    case ShopType.tanning:
      return ref.watch(tanningFilterProvider);
  }
});

final shopFilterStateProvider =
    Provider.autoDispose<ShopFilterCheckState>((ref) {
  final shopType = ref.watch(shopTypeProvider);
  switch (shopType) {
    case ShopType.stduio:
      return ref.watch(studioFilterProvider.notifier);
    case ShopType.beauty:
      return ref.watch(beautyFilterProvider.notifier);
    case ShopType.waxing:
      return ref.watch(waxingFilterProvider.notifier);
    case ShopType.tanning:
      return ref.watch(tanningFilterProvider.notifier);
  }
});

class ShopFilterCheckState extends StateNotifier<List<FilterCheckPair>> {
  ShopFilterCheckState({required this.filters}) : super(filters);

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

final studioFilterProvider = StateNotifierProvider.autoDispose<
    ShopFilterCheckState, List<FilterCheckPair>>(
  (ref) => ShopFilterCheckState(
      filters: shopFilterValue.entries
          .map<FilterCheckPair>(
              (data) => FilterCheckPair(id: data.key, value: data.value))
          .toList()),
);

final beautyFilterProvider = StateNotifierProvider.autoDispose<
    ShopFilterCheckState, List<FilterCheckPair>>(
  (ref) => ShopFilterCheckState(
      filters: shopFilterValue.entries
          .map<FilterCheckPair>(
              (data) => FilterCheckPair(id: data.key, value: data.value))
          .toList()),
);

final waxingFilterProvider = StateNotifierProvider.autoDispose<
    ShopFilterCheckState, List<FilterCheckPair>>(
  (ref) => ShopFilterCheckState(
      filters: shopFilterValue.entries
          .map<FilterCheckPair>(
              (data) => FilterCheckPair(id: data.key, value: data.value))
          .toList()),
);

final tanningFilterProvider = StateNotifierProvider.autoDispose<
    ShopFilterCheckState, List<FilterCheckPair>>(
  (ref) => ShopFilterCheckState(
      filters: shopFilterValue.entries
          .map<FilterCheckPair>(
              (data) => FilterCheckPair(id: data.key, value: data.value))
          .toList()),
);
