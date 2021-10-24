// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_detail_data.freezed.dart';
part 'shop_detail_data.g.dart';

@freezed
class ShopDetailData with _$ShopDetailData {
  factory ShopDetailData({
    required int id,
    required String name,
    required String logo,
    required bool like,
    @JsonKey(name: 'kakaourl') required String kakaoUrl,
    @JsonKey(name: 'address_detail') required String address,
    required List<String> profiles,
    @JsonKey(name: 'map') required String mapImg,
    @JsonKey(name: 'minprice') required int minPrice,
    @JsonKey(name: 'price_desc') required String priceImg,
    @JsonKey(name: 'affiliates') required List<PartnershipData> partnershipList,
  }) = _ShopDetailData;

  factory ShopDetailData.fromJson(Map<String, dynamic> json) =>
      _$ShopDetailDataFromJson(json);
}

@freezed
class PartnershipData with _$PartnershipData {
  factory PartnershipData({
    required int id,
    required String name,
    required String profile,
  }) = _PartnershipData;

  factory PartnershipData.fromJson(Map<String, dynamic> json) =>
      _$PartnershipDataFromJson(json);
}
