import 'package:bpp_riverpod/app/model/concept/concept_filter.dart';
import 'package:bpp_riverpod/app/model/filter_check_pair.dart';
import 'package:bpp_riverpod/app/util/filter_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final conceptFilterCheckProvider = StateNotifierProvider.autoDispose<
    ConceptCheckPairStateList, List<List<FilterCheckPair>>>(
  (ref) => ConceptCheckPairStateList(),
);

final conceptFilter = StateProvider.autoDispose<ConceptFilter>(
  (ref) => ConceptFilter(
    headNum: [],
    gender: [],
    background: [],
    prop: [],
    cloth: [],
  ),
);

final conceptReqFilter = StateProvider.autoDispose<ConceptFilter>(
  (ref) => ConceptFilter(
    headNum: [],
    gender: [],
    background: [],
    prop: [],
    cloth: [],
  ),
);

final concpetFilterEmptyProvider = Provider.autoDispose<bool>((ref) {
  final conceptFilters = ref.watch(conceptFilter);
  if (conceptFilters.headNum.isEmpty &&
      conceptFilters.gender.isEmpty &&
      conceptFilters.background.isEmpty &&
      conceptFilters.prop.isEmpty &&
      conceptFilters.cloth.isEmpty) {
    return false;
  }
  return true;
});

class ConceptCheckPairStateList
    extends StateNotifier<List<List<FilterCheckPair>>> {
  ConceptCheckPairStateList()
      : super([
          conceptFilterHeadCountValue.entries
              .map<FilterCheckPair>(
                (data) => FilterCheckPair(id: data.key, value: data.value),
              )
              .toList(),
          conceptFilterGenderValue.entries
              .map<FilterCheckPair>(
                  (data) => FilterCheckPair(id: data.key, value: data.value))
              .toList(),
          conceptFilterBackgroundValue.entries
              .map<FilterCheckPair>(
                  (data) => FilterCheckPair(id: data.key, value: data.value))
              .toList(),
          conceptFilterPropValue.entries
              .map<FilterCheckPair>(
                  (data) => FilterCheckPair(id: data.key, value: data.value))
              .toList(),
          conceptFilterDressValue.entries
              .map<FilterCheckPair>(
                  (data) => FilterCheckPair(id: data.key, value: data.value))
              .toList(),
        ]);

  toggleFilterState(int num, int index) {
    var n = state[num][index].copyWith(check: !state[num][index].check);
    var cur = state;
    cur[num][index] = n;
    state = [...cur];
  }

  refreshFilterState() {
    var cur = state;
    for (var i = 0; i < cur.length; i++) {
      for (var j = 0; j < cur[i].length; j++) {
        cur[i][j] = cur[i][j].copyWith(check: false);
      }
    }
    state = [...cur];
  }

  ConceptFilter makeFilter() {
    ConceptFilter filter = ConceptFilter(
      headNum: [],
      gender: [],
      background: [],
      prop: [],
      cloth: [],
    );

    for (var i = 0; i < state.length; i++) {
      for (var j = 0; j < state[i].length; j++) {
        if (state[i][j].check) {
          switch (i) {
            case 0:
              filter.headNum.add(state[i][j].id);
              break;
            case 1:
              filter.gender.add(state[i][j].id);
              break;
            case 2:
              filter.background.add(state[i][j].id);
              break;
            case 3:
              filter.prop.add(state[i][j].id);
              break;
            case 4:
              filter.cloth.add(state[i][j].id);
              break;
          }
        }
      }
    }

    return filter;
  }

  ConceptFilter makeReqFilter() {
    ConceptFilter filter = ConceptFilter(
      headNum: [],
      gender: [],
      background: [],
      prop: [],
      cloth: [],
    );
    for (var i = 0; i < state.length; i++) {
      for (var j = 0; j < state[i].length; j++) {
        if (state[i][j].check) {
          switch (i) {
            case 0:
              filter.headNum.add(state[i][j].value);
              break;
            case 1:
              filter.gender.add(state[i][j].value);
              break;
            case 2:
              filter.background.add(state[i][j].value);
              break;
            case 3:
              filter.prop.add(state[i][j].value);
              break;
            case 4:
              filter.cloth.add(state[i][j].value);
              break;
          }
        }
      }
    }
    return filter;
  }
}
