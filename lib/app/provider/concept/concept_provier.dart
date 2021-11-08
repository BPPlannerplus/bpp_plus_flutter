import 'package:bpp_riverpod/app/model/concept/concept.dart';
import 'package:bpp_riverpod/app/model/concept/concept_list.dart';
import 'package:bpp_riverpod/app/repository/concept_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConceptListState extends StateNotifier<ConceptList> {
  ConceptListState({required this.repository})
      : super(ConceptList(concepts: [], next: 'true'));

  final ConceptRepository repository;

  Future<ConceptList> getData() async {
    var newData = await repository.getConceptList();
    state = state.copyWith(
      concepts: [
        ...state.concepts,
        ...newData.concepts,
      ],
      next: newData.next,
    );

    return newData;
  }

  void setLike(int id) {
    state = state.copyWith(
      concepts: state.concepts.map<Concept>((e) {
        return e.id == id ? e.copyWith(like: !e.like) : e;
      }).toList(),
    );
  }

  reset() {
    state = state.copyWith(concepts: [], next: 'true');
    getData();
  }
}

class ConceptState extends StateNotifier<Concept> {
  ConceptState(Concept state) : super(state);

  void setLike(int id) {
    state = state.copyWith(like: !state.like);
  }
}

final conceptListProvider =
    StateNotifierProvider<ConceptListState, ConceptList>(
  (ref) => ConceptListState(
    repository: FakeConceptRepository(),
  ),
);

final conceptProvider = StateNotifierProvider.family
    .autoDispose<ConceptState, Concept, Concept>((ref, concept) {
  return ConceptState(concept);
});
