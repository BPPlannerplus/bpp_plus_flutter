import 'package:bpp_riverpod/app/model/concept/concept.dart';
import 'package:bpp_riverpod/app/model/concept/concept_list.dart';
import 'package:bpp_riverpod/app/model/like.dart';

abstract class ConceptRepository {
  // 컨셉 조회
  Future<ConceptList> getConceptList();

  // 좋아요
  Future<LikeResponse> setLike(int id);
}

class FakeConceptRepository implements ConceptRepository {
  @override
  Future<ConceptList> getConceptList() async {
    await Future.delayed(const Duration(seconds: 1));
    var newData = ConceptList(
      concepts: List.generate(
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
      ).toList(),
      next: 'true',
    );

    return newData;
  }

  @override
  Future<LikeResponse> setLike(int id) {
    throw UnimplementedError();
  }
}
