import 'package:freezed_annotation/freezed_annotation.dart';

part 'concept.g.dart';
part 'concept.freezed.dart';

@freezed
class Concept with _$Concept {
  factory Concept({
    required int id,
    required String profile,
    required IdNamePair shop,
    required bool like,
  }) = _Concept;

  factory Concept.fromJson(Map<String, dynamic> json) =>
      _$ConceptFromJson(json);
}

@freezed
class IdNamePair with _$IdNamePair {
  factory IdNamePair({
    required int id,
    required String name,
  }) = _IdNamePair;

  factory IdNamePair.fromJson(Map<String, dynamic> json) =>
      _$IdNamePairFromJson(json);
}
