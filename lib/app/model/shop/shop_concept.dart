import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_concept.g.dart';
part 'shop_concept.freezed.dart';

@freezed
class ShopConcepts with _$ShopConcepts {
  factory ShopConcepts({
    required List<ShopConcept> shopConcepts,
    String? next,
  }) = _ShopConcepts;

  factory ShopConcepts.fromJson(Map<String, dynamic> json) =>
      _$ShopConceptsFromJson(json);
}

@freezed
class ShopConcept with _$ShopConcept {
  factory ShopConcept({
    required int id,
    required String profile,
  }) = _ShopConcept;

  factory ShopConcept.fromJson(Map<String, dynamic> json) =>
      _$ShopConceptFromJson(json);
}
