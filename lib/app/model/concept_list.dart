import 'package:bpp_riverpod/app/model/concept.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'concept_list.g.dart';
part 'concept_list.freezed.dart';

@freezed
class ConceptList with _$ConceptList {
  factory ConceptList({
    required List<Concept> concepts,
    String? next,
  }) = _ConceptList;

  factory ConceptList.fromJson(Map<String, dynamic> json) =>
      _$ConceptListFromJson(json);
}
