// ignore_for_file: invalid_annotation_target

import 'package:bpp_riverpod/app/model/concept/concept.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'concept_list.g.dart';
part 'concept_list.freezed.dart';

@freezed
class ConceptList with _$ConceptList {
  factory ConceptList({
    @JsonKey(name: 'results') required List<Concept> concepts,
    String? next,
  }) = _ConceptList;

  factory ConceptList.fromJson(Map<String, dynamic> json) =>
      _$ConceptListFromJson(json);
}
