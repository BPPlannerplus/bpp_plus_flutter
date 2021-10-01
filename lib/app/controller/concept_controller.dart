import 'package:bpp_plus_flutter/app/data/model/concept/concept.dart';
import 'package:bpp_plus_flutter/app/data/model/concept/concept_check_pair.dart';
import 'package:bpp_plus_flutter/app/data/model/concept/concept_filter.dart';
import 'package:bpp_plus_flutter/app/data/model/concept/concept_list.dart';
import 'package:bpp_plus_flutter/app/data/repository/concept_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ConceptController extends GetxController {
  final repository = ConceptRepository();

  var scrollController = ScrollController();
  ConceptList data = ConceptList(
    concepts: [
      Concept(
          id: 1,
          profile: '1',
          shop: IdNamePair(id: 1, name: 'studio1'),
          like: true),
      Concept(
          id: 1,
          profile: '1',
          shop: IdNamePair(id: 1, name: 'studio1'),
          like: true),
      Concept(
          id: 1,
          profile: '1',
          shop: IdNamePair(id: 1, name: 'studio1'),
          like: true),
      Concept(
          id: 1,
          profile: '1',
          shop: IdNamePair(id: 1, name: 'studio1'),
          like: true),
      Concept(
          id: 1,
          profile: '1',
          shop: IdNamePair(id: 1, name: 'studio1'),
          like: true),
      Concept(
          id: 1,
          profile: '1',
          shop: IdNamePair(id: 1, name: 'studio1'),
          like: true),
      Concept(
          id: 1,
          profile: '1',
          shop: IdNamePair(id: 1, name: 'studio1'),
          like: false),
      Concept(
          id: 1,
          profile: '1',
          shop: IdNamePair(id: 1, name: 'studio1'),
          like: false),
      Concept(
          id: 1,
          profile: '1',
          shop: IdNamePair(id: 1, name: 'studio1'),
          like: false),
      Concept(
          id: 1,
          profile: '1',
          shop: IdNamePair(id: 1, name: 'studio1'),
          like: false),
      Concept(
          id: 1,
          profile: '1',
          shop: IdNamePair(id: 1, name: 'studio1'),
          like: false),
      Concept(
          id: 1,
          profile: '1',
          shop: IdNamePair(id: 1, name: 'studio1'),
          like: false),
    ],
    next: 'true',
  );

  var isLoading = false;
  var hasMore = false;
  var isShow = true;

  var conceptFilter = ConceptFilter(
    headNum: ['', ''],
    gender: ['', ''],
    background: ['', ''],
    prop: ['', ''],
    cloth: ['', ''],
  );

  var filters = [
    [
      ConceptCheckPair(id: '1인', value: '1'),
      ConceptCheckPair(id: '2인', value: '2'),
      ConceptCheckPair(id: '3인이상', value: '3'),
    ],
    [
      ConceptCheckPair(id: '여성', value: 'woman'),
      ConceptCheckPair(id: '남성', value: 'man'),
    ],
    [
      ConceptCheckPair(id: '흰색', value: 'white'),
      ConceptCheckPair(id: '검은색', value: 'black'),
      ConceptCheckPair(id: '유채색', value: 'chromatic'),
      ConceptCheckPair(id: '야외', value: 'outside'),
      ConceptCheckPair(id: '기타배경', value: 'etc'),
    ],
    [
      ConceptCheckPair(id: '헬스도구', value: 'health'),
      ConceptCheckPair(id: '소가구', value: 'mini'),
      ConceptCheckPair(id: '기타소품', value: 'etc'),
    ],
    [
      ConceptCheckPair(id: '애슬레저', value: 'athleisure'),
      ConceptCheckPair(id: '수영복', value: 'swimsuit'),
      ConceptCheckPair(id: '언더웨어', value: 'underwear'),
      ConceptCheckPair(id: '기타', value: 'etc'),
    ],
  ];

  toggleFilterState(int num, int index) {
    for (int buttonIndex = 0;
        buttonIndex < filters[num].length;
        buttonIndex++) {
      if (buttonIndex == index) {
        filters[num][buttonIndex].check = true;
      } else {
        filters[num][buttonIndex].check = false;
      }
    }

    update();
  }

  refreshFilterState() {
    for (var i = 0; i < filters.length; i++) {
      for (var j = 0; j < filters[i].length; j++) {
        filters[i][j].check = false;
      }
    }
    conceptFilter = ConceptFilter(
      headNum: ['', ''],
      gender: ['', ''],
      background: ['', ''],
      prop: ['', ''],
      cloth: ['', ''],
    );
    update();
  }

  makeFilter() {
    for (var i = 0; i < filters.length; i++) {
      for (var j = 0; j < filters[i].length; j++) {
        if (filters[i][j].check) {
          switch (i) {
            case 0:
              conceptFilter.headNum = [filters[i][j].id, filters[i][j].value];
              break;
            case 1:
              conceptFilter.gender = [filters[i][j].id, filters[i][j].value];
              break;
            case 2:
              conceptFilter.background = [
                filters[i][j].id,
                filters[i][j].value
              ];
              break;
            case 3:
              conceptFilter.prop = [filters[i][j].id, filters[i][j].value];
              break;
            case 4:
              conceptFilter.cloth = [filters[i][j].id, filters[i][j].value];
              break;
          }
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    _getData();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          hasMore) {
        _getData();
      }

      final direction = scrollController.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        isShow = true;
      } else {
        isShow = false;
      }
      update();
    });

    super.onInit();
  }

  _getData() async {
    isLoading = true;

    await Future.delayed(const Duration(seconds: 1));

    var newData = repository.getConceptList(1, false, conceptFilter);
    var addData = [...data.concepts, ...newData.concepts];
    data = ConceptList(concepts: addData);

    isLoading = false;

    hasMore = newData.next != null;

    update();
  }
}
