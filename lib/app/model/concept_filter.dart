import 'package:freezed_annotation/freezed_annotation.dart';

part 'concept_filter.freezed.dart';

@freezed
class ConceptFilter with _$ConceptFilter {
  factory ConceptFilter({
    required List<String> headNum,
    required List<String> gender,
    required List<String> background,
    required List<String> prop,
    required List<String> cloth,
  }) = _ConceptFilter;
}
