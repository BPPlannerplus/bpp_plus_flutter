import 'package:bpp_plus_flutter/app/controller/bottom_navigation_controller.dart';
import 'package:bpp_plus_flutter/app/data/model/concept/concept.dart';
import 'package:bpp_plus_flutter/app/data/model/concept/concept_filter.dart';
import 'package:bpp_plus_flutter/app/data/model/concept/concept_list.dart';
import 'package:bpp_plus_flutter/app/data/repository/concept_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ConceptController extends GetxController {
  final repository = ConceptRepository();
  final bottomNavigationController = Get.find<BottomNavigationController>();
  final scrollController = ScrollController();

  int _page = 1;

  bool _likeFilter = false;
  bool get likeFilter => _likeFilter;

  ConceptList data = ConceptList(
    concepts: [],
  );

  bool _isLoading = false;
  bool _hasMore = false;

  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  bool isFilterEmpty = false;

  ConceptFilter _conceptFilter = ConceptFilter(
    headNum: ['', ''],
    gender: ['', ''],
    background: ['', ''],
    prop: ['', ''],
    cloth: ['', ''],
  );
  ConceptFilter get filter => _conceptFilter;

  @override
  void onInit() {
    _getData();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          _hasMore) {
        _getData();
      }

      final direction = scrollController.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        bottomNavigationController.bottomVisible = true;
      } else {
        bottomNavigationController.bottomVisible = false;
      }
    });

    super.onInit();
  }

  setFilter(ConceptFilter filter) {
    _conceptFilter = filter;
    reset();
    update();
  }

  _getData() async {
    _isLoading = true;

    await Future.delayed(const Duration(milliseconds: 500));

    var newData = repository.getConceptList(_page++, false, _conceptFilter);
    data.concepts.addAll(newData.concepts);

    _isLoading = false;

    _hasMore = newData.next != null;

    update();
  }

  Concept getConcept(int index) => data.concepts[index];

  setLikeConcept(int index) {
    data.concepts[index].like = !data.concepts[index].like;
    update();
  }

  setLikeFilter() {
    _likeFilter = !_likeFilter;
    reset();
    update();
  }

  reset() {
    data.concepts.clear();
    _page = 1;
    update();
    _getData();
  }
}
