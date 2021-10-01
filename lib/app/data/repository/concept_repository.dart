import 'package:bpp_plus_flutter/app/data/model/concept/concept.dart';
import 'package:bpp_plus_flutter/app/data/model/concept/concept_filter.dart';
import 'package:bpp_plus_flutter/app/data/model/concept/concept_list.dart';

class ConceptRepository {
  // 리스트 조회
  ConceptList getConceptList(int page, bool likeFilter, ConceptFilter filter) {
    return ConceptList(
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
  }

  setLike(int id, bool like) {
    print('좋아요');
  }
}
