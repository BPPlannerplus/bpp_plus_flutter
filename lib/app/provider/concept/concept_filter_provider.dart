import 'package:bpp_riverpod/app/model/concept/concept_filter.dart';
import 'package:bpp_riverpod/app/model/filter_check_pair.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConceptCheckPairStateList
    extends StateNotifier<List<List<FilterCheckPair>>> {
  ConceptCheckPairStateList()
      : super([
          [
            FilterCheckPair(id: '1인', value: '1'),
            FilterCheckPair(id: '2인', value: '2'),
            FilterCheckPair(id: '3인이상', value: '3'),
          ],
          [
            FilterCheckPair(id: '여성', value: 'woman'),
            FilterCheckPair(id: '남성', value: 'man')
          ],
          [
            FilterCheckPair(id: '흰색', value: 'white'),
            FilterCheckPair(id: '검은색', value: 'black'),
            FilterCheckPair(id: '유채색', value: 'chromatic'),
            FilterCheckPair(id: '야외', value: 'outside'),
            FilterCheckPair(id: '기타 배경', value: 'etc'),
          ],
          [
            FilterCheckPair(id: '헬스도구', value: 'health'),
            FilterCheckPair(id: '소가구', value: 'mini'),
            FilterCheckPair(id: '기타 소품', value: 'etc'),
          ],
          [
            FilterCheckPair(id: '애슬레저', value: 'athleisure'),
            FilterCheckPair(id: '수영복', value: 'swimsuit'),
            FilterCheckPair(id: '언더웨어', value: 'underwear'),
            FilterCheckPair(id: '기타', value: 'etc'),
          ],
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

final conceptFilterCheckProvider = StateNotifierProvider<
    ConceptCheckPairStateList, List<List<FilterCheckPair>>>(
  (ref) => ConceptCheckPairStateList(),
);

final conceptFilter = StateProvider<ConceptFilter>(
  (ref) => ConceptFilter(
    headNum: [],
    gender: [],
    background: [],
    prop: [],
    cloth: [],
  ),
);

final conceptReqFilter = StateProvider<ConceptFilter>(
  (ref) => ConceptFilter(
    headNum: [],
    gender: [],
    background: [],
    prop: [],
    cloth: [],
  ),
);

final concpetFilterEmptyProvider = Provider<bool>((ref) {
  final conceptFilters = ref.watch(conceptFilter).state;
  if (conceptFilters.headNum.isEmpty &&
      conceptFilters.gender.isEmpty &&
      conceptFilters.background.isEmpty &&
      conceptFilters.prop.isEmpty &&
      conceptFilters.cloth.isEmpty) {
    return false;
  }
  return true;
});
