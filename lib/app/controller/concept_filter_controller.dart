import 'package:bpp_plus_flutter/app/data/model/concept/concept_check_pair.dart';
import 'package:bpp_plus_flutter/app/data/model/concept/concept_filter.dart';
import 'package:get/get.dart';

class ConceptFilterController extends GetxController {
  bool _isFilterEmpty = false;
  bool get isFilterEmpty => _isFilterEmpty;

  ConceptFilter _conceptFilter = ConceptFilter(
    headNum: ['', ''],
    gender: ['', ''],
    background: ['', ''],
    prop: ['', ''],
    cloth: ['', ''],
  );

  ConceptFilter get filter => _conceptFilter;

  final List<List<ConceptCheckPair>> _filters = [
    [
      ConceptCheckPair(id: '1인', value: '1'),
      ConceptCheckPair(id: '2인', value: '2'),
      ConceptCheckPair(id: '3인 이상', value: '3'),
    ],
    [
      ConceptCheckPair(id: '여성', value: 'woman'),
      ConceptCheckPair(id: '남성', value: 'man')
    ],
    [
      ConceptCheckPair(id: '흰색', value: 'white'),
      ConceptCheckPair(id: '검은색', value: 'black'),
      ConceptCheckPair(id: '유채색', value: 'chromatic'),
      ConceptCheckPair(id: '야외', value: 'outside'),
      ConceptCheckPair(id: '기타 배경', value: 'etc'),
    ],
    [
      ConceptCheckPair(id: '헬스도구', value: 'health'),
      ConceptCheckPair(id: '소가구', value: 'mini'),
      ConceptCheckPair(id: '기타 소품', value: 'etc'),
    ],
    [
      ConceptCheckPair(id: '애슬레저', value: 'athleisure'),
      ConceptCheckPair(id: '수영복', value: 'swimsuit'),
      ConceptCheckPair(id: '언더웨어', value: 'underwear'),
      ConceptCheckPair(id: '기타', value: 'etc'),
    ],
  ];

  List<List<ConceptCheckPair>> get filters => _filters;

  toggleFilterState(int num, int index) {
    for (int buttonIndex = 0;
        buttonIndex < _filters[num].length;
        buttonIndex++) {
      if (buttonIndex == index) {
        _filters[num][buttonIndex].check = true;
      } else {
        _filters[num][buttonIndex].check = false;
      }
    }

    _isFilterEmpty = true;
    update();
  }

  refreshFilterState() {
    for (var i = 0; i < _filters.length; i++) {
      for (var j = 0; j < _filters[i].length; j++) {
        _filters[i][j].check = false;
      }
    }

    _isFilterEmpty = false;
    _conceptFilter = ConceptFilter(
      headNum: ['', ''],
      gender: ['', ''],
      background: ['', ''],
      prop: ['', ''],
      cloth: ['', ''],
    );
    update();
  }

  setFilter() {
    for (var i = 0; i < _filters.length; i++) {
      for (var j = 0; j < _filters[i].length; j++) {
        if (_filters[i][j].check) {
          switch (i) {
            case 0:
              _conceptFilter.headNum = [
                _filters[i][j].id,
                _filters[i][j].value
              ];
              break;
            case 1:
              _conceptFilter.gender = [_filters[i][j].id, _filters[i][j].value];
              break;
            case 2:
              _conceptFilter.background = [
                _filters[i][j].id,
                _filters[i][j].value,
              ];
              break;
            case 3:
              _conceptFilter.prop = [_filters[i][j].id, _filters[i][j].value];
              break;
            case 4:
              _conceptFilter.cloth = [_filters[i][j].id, _filters[i][j].value];
              break;
          }
        }
      }
    }
    update();
  }
}
