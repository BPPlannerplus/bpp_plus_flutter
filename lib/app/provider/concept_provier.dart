import 'package:bpp_riverpod/app/model/concept.dart';
import 'package:bpp_riverpod/app/model/concept_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConceptListState extends StateNotifier<ConceptList> {
  ConceptListState()
      : super(
          ConceptList(
            concepts: [],
            next: 'true',
          ),
        );

  getData() async {
    await Future.delayed(const Duration(seconds: 1));

    if (state.concepts.length > 100) {
      state = state.copyWith(
        next: '',
      );
      return;
    }

    var newData = List.generate(
      30,
      (index) => Concept(
        id: index,
        profile:
            'http://file.mk.co.kr/meet/neds/2021/05/image_readtop_2021_441365_16203623974637324.jpg',
        shop: IdNamePair(
          id: index,
          name: 'Concept $index',
        ),
        like: false,
      ),
    );

    state = state.copyWith(
      concepts: [
        ...state.concepts,
        ...newData,
      ],
    );
  }

  setConceptLike(int index) {
    var newConcept = state.concepts[index].copyWith(
      like: !state.concepts[index].like,
    );

    var curConcpets = state.concepts;

    curConcpets[index] = newConcept;

    state = state.copyWith(concepts: curConcpets);
  }

  reset() {
    state = state.copyWith(
      concepts: [],
      next: 'true',
    );

    getData();
  }
}

final conceptListProvider =
    StateNotifierProvider<ConceptListState, ConceptList>(
        (ref) => ConceptListState());
