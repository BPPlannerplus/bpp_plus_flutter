import 'package:bpp_riverpod/app/model/concept/concept.dart';
import 'package:bpp_riverpod/app/model/concept/concept_filter.dart';
import 'package:bpp_riverpod/app/model/concept/concept_list.dart';
import 'package:bpp_riverpod/app/repository/concept_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConceptListState extends StateNotifier<ConceptList> {
  ConceptListState({required this.repository})
      : super(ConceptList(concepts: [], next: 'true'));

  final ConceptRepository repository;

  int _page = 1;

  Future<ConceptList> getData(ConceptFilter filter) async {
    var newData = await repository.getConceptList(_page, filter);
    _page++;

    state = state.copyWith(
      concepts: [
        ...state.concepts,
        ...newData.concepts,
      ],
      next: newData.next ?? 'no Data',
    );

    return newData;
  }

  void setLike(int id) {
    final check =
        state.concepts.where((element) => element.id == id).first.like;
    state = state.copyWith(
      concepts: state.concepts.map<Concept>((e) {
        return e.id == id ? e.copyWith(like: !e.like) : e;
      }).toList(),
    );
    repository.setLike(id, !check);
  }

  reset(ConceptFilter filter) {
    state = state.copyWith(concepts: [], next: 'true');
    _page = 1;
    getData(filter);
  }
}

class ConceptState extends StateNotifier<Concept> {
  ConceptState(Concept state) : super(state);

  void setLike(int id) {
    state = state.copyWith(like: !state.like);
  }
}

final conceptListProvider =
    StateNotifierProvider<ConceptListState, ConceptList>((ref) {
  final repository = ref.watch(conceptRepositoryProvider);
  return ConceptListState(repository: repository);
});

final conceptProvider = StateNotifierProvider.family
    .autoDispose<ConceptState, Concept, Concept>((ref, concept) {
  return ConceptState(concept);
});

final conceptListReadProvider = Provider<ConceptList>((ref) {
  final conceptState = ref.watch(conceptListProvider);
  return conceptState;
});
