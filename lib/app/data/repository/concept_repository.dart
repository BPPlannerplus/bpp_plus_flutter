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
            profile: 'studio1',
            shop: IdNamePair(id: 1, name: 'studio1'),
            like: true),
        Concept(
            id: 2,
            profile: 'studio2',
            shop: IdNamePair(id: 1, name: 'studio2'),
            like: true),
        Concept(
            id: 3,
            profile: 'studio3',
            shop: IdNamePair(id: 1, name: 'studio3'),
            like: true),
        Concept(
            id: 4,
            profile: 'studio4',
            shop: IdNamePair(id: 1, name: 'studio4'),
            like: true),
        Concept(
            id: 5,
            profile: 'studio5',
            shop: IdNamePair(id: 1, name: 'studio5'),
            like: true),
        Concept(
            id: 6,
            profile: 'studio6',
            shop: IdNamePair(id: 1, name: 'studio6'),
            like: true),
        Concept(
            id: 7,
            profile: 'studio7',
            shop: IdNamePair(id: 1, name: 'studio7'),
            like: false),
        Concept(
            id: 8,
            profile: 'studio8',
            shop: IdNamePair(id: 1, name: 'studio8'),
            like: false),
        Concept(
            id: 9,
            profile: 'studio9',
            shop: IdNamePair(id: 1, name: 'studio9'),
            like: false),
        Concept(
            id: 10,
            profile: 'studio10',
            shop: IdNamePair(id: 1, name: 'studio10'),
            like: false),
        Concept(
            id: 11,
            profile: 'studio11',
            shop: IdNamePair(id: 1, name: 'studio11'),
            like: false),
        Concept(
            id: 12,
            profile: 'studio12',
            shop: IdNamePair(id: 1, name: 'studio12'),
            like: false),
      ],
      next: 'true',
    );
  }

  setLike(int id, bool like) {}
}
