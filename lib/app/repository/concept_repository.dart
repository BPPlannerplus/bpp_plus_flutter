import 'package:bpp_riverpod/app/api/api_provider.dart';
import 'package:bpp_riverpod/app/api/concept_client.dart';
import 'package:bpp_riverpod/app/model/concept/concept_filter.dart';
import 'package:bpp_riverpod/app/model/concept/concept_list.dart';
import 'package:bpp_riverpod/app/model/like.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final conceptRepositoryProvider = Provider<ConceptRepository>((ref) {
  final conceptClient = ref.watch(conceptClientProvider);
  return ConceptRepository(conceptClient: conceptClient);
});

class ConceptRepository {
  ConceptRepository({
    required this.conceptClient,
  });

  final ConceptClient conceptClient;

  Future<ConceptList> getConceptList(
      int page, ConceptFilter conceptFilter) async {
    final conceptList = await conceptClient.getStudioList(
      page,
      false,
      conceptFilter.headNum,
      conceptFilter.gender,
      conceptFilter.background,
      conceptFilter.prop,
      conceptFilter.cloth,
    );
    return conceptList;
  }

  Future<dynamic> setLike(int id, bool like) async {
    final response = await conceptClient.setLike(id, LikeRequest(like: like));
    return response;
  }
}
